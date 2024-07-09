import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quouch_app/mocks/images.dart';
import 'package:quouch_app/mocks/stays.dart';
import 'package:quouch_app/screens/place_page.dart';
import 'package:quouch_app/theme/spacing.dart';
import 'package:quouch_app/widgets/divider_block.dart';
import 'package:quouch_app/widgets/screen_header_text.dart';
import 'package:quouch_app/widgets/simple_text_tabs.dart';
import 'package:quouch_app/widgets/trip/stay_card_widget.dart';

class TripPage extends StatefulWidget {
  const TripPage({this.navigateToExploreScreen, super.key});
  final Function? navigateToExploreScreen;

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  late int activeTabIndex;

  @override
  void initState() {
    super.initState();
    activeTabIndex = 0;
  }

  setActiveTab(int index) {
    setState(() {
      activeTabIndex = index;
    });
  }

  List<Widget> _buildUpcomingTab() {
    // Access stays where current time is in between time start and end and generate StayCardWidget from them; Otherwise you can show below
    return [
      RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black),
          text:
              "When you're ready to plan your next trip, we're here to help. ",
          children: [
            TextSpan(
              text: 'Learn more',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  //Launch your site here
                },
              style: const TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      DividerBlock(),
      SizedBox(
        height: 300,
        child: Image.network(
          campingImageUrl,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(height: 32),
      ElevatedButton(
        onPressed: widget.navigateToExploreScreen as void Function()?,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[900],
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Explore Flutter UI',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildPastTab() {
    // Access stays for this profile with end time range in the past and create list of StayCardWidget from them.
    return [
      StayCardWidget(
        stay: aspenStay,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Theme(
              data: Theme.of(context),
              child: PlacePage(
                place: aspenStay.place,
              ),
            ),
          ),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<AppSpacing>()!;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: spacing.lg,
            vertical: spacing.xl,
          ),
          children: [
            const ScreenHeaderText(
              titleText: 'Trips',
            ),
            const SizedBox(height: 32),
            SimpleTextTabs(
              labels: const ['Trips', 'Upcoming'],
              onTabChange: setActiveTab,
            ),
            const SizedBox(height: 32),
            ...[
              _buildUpcomingTab(),
              _buildPastTab(),
            ][activeTabIndex],
          ],
        ),
      ),
    );
  }
}
