import "package:flutter/material.dart";
import "package:english_words/english_words.dart";

import "random_words.dart";
import "favorites.dart";

class Home extends StatelessWidget {
	final _saved = Set<WordPair>();

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
			body: RandomWords(saved: _saved),
		);
	}
}