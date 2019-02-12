import 'package:flutter/material.dart';

class ScheduleMenu extends StatelessWidget {

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
              children: <Widget>[
                Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                new Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: new Scaffold(
                    body: DefaultTabController(length: 4, child: TabBarView(
                      children: [
                        new Container(
                          color: Colors.yellow,
                        ),
                        new Container(
                          color: Colors.orange,
                        ),
                        new Container(
                          color: Colors.lightGreen,
                        ),
                        new Container(
                          color: Colors.red,
                        ),
                      ],
                    )),
                    backgroundColor: Colors.black,
                  ),
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