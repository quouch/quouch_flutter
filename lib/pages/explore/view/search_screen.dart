import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:quouch_app/mocks/cities.dart';
import 'package:quouch_app/mocks/images.dart';
import 'package:quouch_app/pages/explore/widgets/widgets.dart';
import 'package:quouch_app/theme/theme.dart';
import 'package:quouch_app/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late String searchInput;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    searchInput = '';
    _textEditingController = TextEditingController();
    super.initState();
  }

  void setSearchInput(String value) {
    setState(() {
      searchInput = value;
    });
  }

  double rowheight = 75;
  double spacingHeight = 16;

  List<Widget> _buildCityWidgets() {
    var filteredCityWidgets = cityWidgets
        .where((city) =>
            city.title.toLowerCase().contains(searchInput.toLowerCase()))
        .map((w) => SizedBox(height: rowheight, child: w));

    return intersperse(SizedBox(height: spacingHeight), filteredCityWidgets)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var cityWidgets = _buildCityWidgets();
    final spacing = Theme.of(context).extension<AppSpacing>()!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const AppBarBackButton(),
        title: TextField(
          autofocus: true,
          textAlignVertical: TextAlignVertical.center,
          textInputAction: TextInputAction.search,
          controller: _textEditingController,
          onChanged: setSearchInput,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Where are you going?',
            suffixIcon: IconButton(
              icon: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                _textEditingController.clear();
                setSearchInput('');
              },
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: spacing.lg),
        children: [
          SizedBox(
            height: rowheight,
            child: const RowTileWithImage(
              title: 'Explore nearby destinations',
              imageUrl: locationImageUrl,
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'GETAWAYS NEAR YOU',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: spacingHeight),
          ...cityWidgets
        ],
      ),
    );
  }
}
