import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:quouch_app/mocks/images.dart';
import 'package:quouch_app/pages/explore/explore.dart';
import 'package:quouch_app/utils/create_route.dart';

class CustomSliverAppBar extends StatefulWidget {
  const CustomSliverAppBar({super.key});

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  late bool isToolbarCollapsed;

  @override
  void initState() {
    super.initState();
    isToolbarCollapsed = false;
  }

  @override
  Widget build(BuildContext context) {
    const double expandedHeight = 600;
    const offset = Offset(36, -42);
    const double textSize = 30;

    return SliverAppBar(
      foregroundColor: Colors.white,
      title: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          createRoute(const SearchScreen(), context),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isToolbarCollapsed ? Colors.grey[100] : Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100), // As rounded as possible
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, color: Theme.of(context).primaryColor),
            const SizedBox(
              width: 4,
            ),
            const Text(
              'Where are you going?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      pinned: true,
      backgroundColor: isToolbarCollapsed ? Colors.white : Colors.black,
      expandedHeight: expandedHeight,
      collapsedHeight: 68,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            if (!isToolbarCollapsed && constraints.biggest.height <= 130) {
              setState(() {
                isToolbarCollapsed = true;
              });
            } else if (isToolbarCollapsed && constraints.biggest.height > 130) {
              setState(() {
                isToolbarCollapsed = false;
              });
            }
          });
          return FlexibleSpaceBar(
            background: Transform.translate(
              offset: offset,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    cabinImageUrl,
                  ),
                  const Positioned(
                    left: 0,
                    bottom: 0,
                    child: Text(
                      'Made possible\nby Hosts',
                      style: TextStyle(color: Colors.white, fontSize: textSize),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
