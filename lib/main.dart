import "package:flutter/material.dart";

void main() => runApp(App());

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Startup Name Generator",
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Startup Name Generator"),
        ),
        body: Center(
          child: Text("Startup Name Generator"),
        ),
      ),
    );
  }
}