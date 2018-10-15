import "package:flutter/material.dart";

class Favorites extends StatefulWidget {
	Favorites({Key key, this.saved, this.context}) : super(key: key);

  final Set<String> saved;
	final BuildContext context;

	@override
	_FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  Map<String, bool> favorites = Map<String, bool>();
	TextStyle _biggerFont = TextStyle(fontSize: 18.0);

	void initState() {
		super.initState();
    setState(() {
      widget.saved.forEach((String fav) {
        favorites[fav] = false;
      });
    });
	}

  List<Widget> _buildActionList() {
    IconButton _deleteIcon = IconButton(
      icon: Icon(Icons.delete_outline),
      onPressed: () => print("Pressed delete button"),
    );
    List<Widget> _list = [];
    setState(() {
      if (favorites.containsValue(true)) {
        _list.add(_deleteIcon);
      }
    });
    return _list;
  }

  Widget _buildList() {
  	final listTiles = favorites.keys.map((String key) => CheckboxListTile(
  		activeColor: Colors.black,
  		title: Text(key, style: _biggerFont),
  		value: favorites[key],
  		onChanged: (bool _value) {
  			setState(() {
  				favorites[key] = _value;
  			});
  		}
  	));
    final dividedTiles = ListTile.divideTiles(
      tiles: listTiles,
      context: context,
    );
    final listView = ListView(children: dividedTiles.toList());
    return listView;
  }

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Favorites"),
        actions: _buildActionList(),
			),
      body: _buildList(),
		);
	}
}