import "package:flutter/material.dart";

import "home.dart";

void main() => runApp(App());

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Startup Name Generator",
      theme: ThemeData(
        primaryColor: Colors.white,
        dividerColor: Colors.black,
      ),
      home: Home(),
    );
  }
}