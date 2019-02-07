import 'package:flutter/material.dart';

class ContactUsMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/bluebg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
              children: <Widget>[Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    margin: new EdgeInsets.only(left: 250.0),
                    child: Image.asset("assets/logo.png"),
                    padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                  )
                ],
              ),
              Center(child: Stack(
                children: <Widget>[
                  new Container(
                    child: Image.asset("assets/contactshexagon.png"),
                    padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 45.0),)
                ],
              )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Container(
                    child: Image.asset("assets/landscapewhite.png"),
                    padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),)
                ],
              )
              ]
          ),
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
                  icon: Icon(Icons.arrow_back),
                  iconSize: 40,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        )
    );
  }
}