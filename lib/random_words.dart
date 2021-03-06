import "package:flutter/material.dart";
import "package:english_words/english_words.dart";

class RandomWords extends StatefulWidget {
	RandomWords({ Key key, this.saved, this.saveFavorites }) : super(key: key);
  
	final Set<String> saved;
  final saveFavorites;

	@override
	_RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
	final _suggestions = <WordPair>[];
	final _biggerFont = TextStyle(fontSize: 18.0);

	Widget _buildListTile(WordPair pair) {
    final String _text = pair.asPascalCase;
    final bool _alreadySaved = widget.saved.contains(_text);

		return ListTile(
			title: Text(
        _text,
				style: _biggerFont,
			),
			trailing: Icon(
				_alreadySaved ? Icons.favorite : Icons.favorite_border,
				color: _alreadySaved ? Colors.red : null,
			),
			onTap: () {
				setState(() {
					if (_alreadySaved) {
            widget.saved.remove(_text);
					} else {
            widget.saved.add(_text);
					}
          // update shared preferences
          widget.saveFavorites(widget.saved.toList());
				});
			},
		);
	}

	Widget _buildList() {
		return ListView.builder(
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