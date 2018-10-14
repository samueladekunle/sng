import "package:flutter/material.dart";
import "package:english_words/english_words.dart";

class Favorites extends StatefulWidget {
  Favorites({Key key, this.saved}) : super(key: key);

  final Set<WordPair> saved;

  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
    );
  }
}