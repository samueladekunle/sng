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

  _loadSaved() async {
    _prefs = await SharedPreferences.getInstance();
    final _list = _prefs.get("favorites");

    if (_list == null) {
      _prefs.setStringList("favorites", _saved.toList());
    } else {
      _saved = Set.from(_list);
    }

    print("The value of _saved is $_saved");
  }

  initState() {
    super.initState();
    _loadSaved();
  }

  void _onPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => Favorites(saved: _saved, context: context),
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
						onPressed: () => _onPressed(context),
						tooltip: "Favorites",
					),
				],
			),
			body: RandomWords(
        prefs: _prefs,
        saved: _saved,
      ),
		);
	}
}