import 'package:flutter/material.dart';
import 'package:icms_bulgaria/CustomWidgets/HexagonButton.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    new Container(
                      margin: new EdgeInsets.only(right: 0.0, bottom: 340.0),
                      child: HexagonButton("Info"),
                    ),
                    new Container(
                      margin: new EdgeInsets.only(right: 105.0, bottom: 160.0),
                      child: HexagonButton("ass"),
                    ),
                    new Container(
                      margin: new EdgeInsets.only(left: 105.0, bottom: 160.0),
                      child: HexagonButton("ass"),
                    ),
                    new Container(
                      margin: new EdgeInsets.only(left: 0.0, top: 20.0),
                      child: HexagonButton("ass"),
                    ),
                    new Container(
                      margin: new EdgeInsets.only(right: 210.0, top: 20.0),
                      child: HexagonButton("ass"),
                    ),
                    new Container(
                      margin: new EdgeInsets.only(left: 210.0, top: 20.0),
                      child: HexagonButton("ass"),
                    ),
                    new Container(
                      margin: new EdgeInsets.only(right: 105.0, top: 200.0),
                      child: HexagonButton("ass"),
                    ),
                    new Container(
                      margin: new EdgeInsets.only(left: 105.0, top: 200.0),
                      child: HexagonButton("ass"),
                    ),
                    new Container(
                      margin: new EdgeInsets.only(right: 0.0, top: 380.0),
                      child: HexagonButton("Info"),
                    ),
                  ],
                )
              ],
            )
        ), /* add child content content here */
      ),
      bottomNavigationBar:  new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/footer.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: new BottomAppBar(
          color: Colors.transparent,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                iconSize: 40,
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.mail),
                color: Colors.white,
                iconSize: 40,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}