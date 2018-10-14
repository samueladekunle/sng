import "package:flutter/material.dart";
import "package:english_words/english_words.dart";

class Favorites extends StatefulWidget {
	Favorites({Key key, this.saved, this.context}) : super(key: key);

	final Set<WordPair> saved;
	final BuildContext context;

	@override
	_FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
	var tiles, divided;
	TextStyle _biggerFont = TextStyle(fontSize: 18.0);

	initState() {
		super.initState();
		tiles = widget.saved.map((WordPair pair) => ListTile(
			title: Text(pair.asPascalCase, style: _biggerFont),
		));
		divided = ListTile.divideTiles(
			context: widget.context,
			tiles: tiles,
		).toList();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Favorites"),
			),
			body: ListView(children: divided),
		);
	}
}