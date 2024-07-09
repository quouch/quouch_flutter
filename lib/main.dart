import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';
import 'package:quouch_app/mocks/users.dart';
import 'package:quouch_app/screens/favorites_page.dart';
import 'package:quouch_app/screens/generator_page.dart';
import 'package:quouch_app/screens/inbox_page.dart';
import 'package:quouch_app/screens/profile_page.dart';
import 'package:quouch_app/screens/trip_page.dart';
import 'package:quouch_app/theme/spacing.dart';

void main() {
  runApp(const QuouchApp());
}

class QuouchApp extends StatelessWidget {
  const QuouchApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Quouch App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          extensions: [AppSpacing()],
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var navBarIndex = 0;

  @override
  void initState() {
    super.initState();
    navBarIndex = 2;
  }

  navigateToExplore() {
    setState(() {
      navBarIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: navBarIndex,
            onTap: (value) => {
              setState(() {
                navBarIndex = value;
              })
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Saved'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.all_inclusive), label: 'Trips'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble), label: 'Inbox'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: 'Profile')
            ],
          ),
          body: [
            const GeneratorPage(),
            const FavoritesPage(),
            TripPage(navigateToExploreScreen: navigateToExplore),
            const InboxPage(),
            const ProfilePage(profile: testProfile),
          ][navBarIndex]);
    });
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite(wordPair) {
    if (favorites.contains(wordPair)) {
      favorites.remove(wordPair);
    } else {
      favorites.add(wordPair);
    }
    notifyListeners();
  }
}
// --- Do not delete ---
/* 
This is the navigation layout! Do not delete, we might need it later.
    Widget page;

    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = FavoritesPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
 return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
                child: NavigationRail(
              extended: constraints.maxWidth >= 600,
              destinations: [
                NavigationRailDestination(
                    icon: Icon(Icons.home), label: Text('Home')),
                NavigationRailDestination(
                    icon: Icon(Icons.favorite), label: Text('Favorites'))
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) => {
                setState(() {
                  selectedIndex = value;
                })
              },
            )),
            Expanded(
                child: Container(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: page)),
          ],
        ),
      );
    });
    */