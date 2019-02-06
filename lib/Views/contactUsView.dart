import 'package:flutter/material.dart';

class ContactUsMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
            child: Center(child: Stack(
                children: <Widget>[
                    Image.asset("assets/hexagonstatic.png")
                ],
                ),
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
                      icon: Icon(Icons.home),
                      iconSize: 40,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
        )
    );
  }
}




