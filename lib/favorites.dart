import "package:flutter/material.dart";

class Favorites extends StatefulWidget {
	Favorites({Key key, this.saved, this.context}) : super(key: key);

  final Set<String> saved;
	final BuildContext context;

	@override
	_FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
	var tiles, divided;
	TextStyle _biggerFont = TextStyle(fontSize: 18.0);

	initState() {
		super.initState();
    tiles = widget.saved.map((String text) => ListTile(
      title: Text(text, style: _biggerFont),
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