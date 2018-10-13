import "package:flutter/material.dart";
import "package:english_words/english_words.dart";

class RandomWords extends StatefulWidget {
	@override
	_RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
	final _suggestions = <WordPair>[];
	final _saved = Set<WordPair>();
	final _biggerFont = TextStyle(fontSize: 18.0);

	Widget _buildListTile(WordPair pair) {
		final bool _alreadySaved = _saved.contains(pair);
		return ListTile(
			title: Text(
				pair.asPascalCase,
				style: _biggerFont,
			),
			trailing: Icon(
				_alreadySaved ? Icons.favorite : Icons.favorite_border,
				color: _alreadySaved ? Colors.red : null,
			),
			onTap: () {
				setState(() {
					if (_alreadySaved) {
						_saved.remove(pair);
					} else {
						_saved.add(pair);
					}
				});
			},
		);
	}

	Widget _buildList() {
		return ListView.builder(
			padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
			itemBuilder: (context, i) {
				if (i.isOdd)
					return Divider();

				final index = i ~/ 2;
				if (index >= _suggestions.length)
					_suggestions.addAll(generateWordPairs().take(10));

				return _buildListTile(_suggestions[index]);
			},
		);
	}

	Widget build(BuildContext context) {
		return Scaffold(
			body: _buildList(),
		);
	}
}