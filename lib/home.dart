import "package:flutter/material.dart";
import "package:english_words/english_words.dart";

import "random_words.dart";
import "favorites.dart";

class Home extends StatelessWidget {
	final _saved = Set<WordPair>();

	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Startup Name Generator"),
				actions: [
					IconButton(
						icon: Icon(Icons.list),
						onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => Favorites(saved: _saved)),
              );
            },
						tooltip: "Favorites",
					),
				],
			),
			body: RandomWords(saved: _saved),
		);
	}
}