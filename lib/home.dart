import "package:flutter/material.dart";

class Home extends StatelessWidget {
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Startup Name Generator"),
				actions: [
					IconButton(
						icon: Icon(Icons.list),
						onPressed: null,
						tooltip: "Favorites",
					),
				],
			),
			body: Center(
				child: Text("Startup Name Generator"),
			),
		);
	}
}