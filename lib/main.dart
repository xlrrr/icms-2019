import 'package:flutter/material.dart';
import 'package:icms_bulgaria/CustomWidgets/HexagonButton.dart';

void main() => runApp(ICMSApp());

class ICMSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ICMS 2019',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MainMenu()
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
          child: new Row(
          children: <Widget>[
            new Expanded(
              child: new HexagonButton("schedule"),
            ),
            new Expanded(
              child: new HexagonButton("schedule"),
            )
            ],
          ),
        ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
