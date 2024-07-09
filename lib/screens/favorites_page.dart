import 'package:flutter/material.dart';
import 'package:quouch_app/main.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    var content = Text("You have no favorites");

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: favorites.isEmpty
            ? content
            : ListView(children: [
                Text('You have '
                    '${appState.favorites.length} favorites:'),
                for (var pair in favorites)
                  ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text(pair.asPascalCase),
                      onTap: () {
                        appState.toggleFavorite(pair);
                      }),
              ]),
      ),
    );
  }
}
