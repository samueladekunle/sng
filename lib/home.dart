import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

import "random_words.dart";
import "favorites.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Set<String> _saved = Set<String>();
  SharedPreferences _prefs;

  void _saveFavorites(List<String> favorites) async {
    await _prefs.setStringList("favorites", favorites);
  }

  void _loadSaved() async {
    _prefs = await SharedPreferences.getInstance();
    final _list = _prefs.get("favorites");

    setState(() {
      if (_list == null) {
        _prefs.setStringList("favorites", _saved.toList());
      } else {
        _saved = Set<String>.from(_list);
      }
    });
  }

  void initState() {
    super.initState();
    _loadSaved();
  }

  void _onPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => Favorites(saved: _saved, saveFavorites: _saveFavorites),
      ),
    );
  }

	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Startup Name Generator"),
				actions: [
					IconButton(
						icon: Icon(Icons.list),
						onPressed: () => _onPressed(),
						tooltip: "Go to Favorites",
					),
				],
			),
			body: RandomWords(
        saved: _saved,
        saveFavorites: _saveFavorites,
      ),
		);
	}
}