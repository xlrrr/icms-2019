import 'package:flutter/material.dart';
import 'package:icms_bulgaria/Views/contactUsView.dart';
import 'package:icms_bulgaria/CustomWidgets/bullet.dart';

class TransportationMenu extends StatelessWidget {
  final String title;

  TransportationMenu({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                ],
              ),
              new Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: ListView(
                  children: <Widget>[
                    Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text("Transportation", style: TextStyle(color: Colors.black, height: 2, fontSize: 35), textAlign: TextAlign.center))
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text("You can access the Registration Venue (Medico-Biological Complex - MBC) with every kind of public transportation there is:", style: TextStyle(color: Colors.black, height: 1.6, fontSize: 20), textAlign: TextAlign.center))
                                ],
                              ),
                            ),
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new ListTile(
                                  leading: new Bullet(),
                                  title: new Text('Subway Line 2: National Palace of Culture Station', style: TextStyle(color: Colors.black, height: 1.5, fontSize: 15)),
                                ),
                                new ListTile(
                                  leading: new Bullet(),
                                  title: new Text('Tram Line 1, 6 and 7: bul. Pencho Slaveykov Station', style: TextStyle(color: Colors.black, height: 1.5, fontSize: 15)),
                                ),
                                new ListTile(
                                  leading: new Bullet(),
                                  title: new Text('Bus line 72: bul. Virosha Station or St. Ekaterina Hospital Station', style: TextStyle(color: Colors.black, height: 1.5, fontSize: 15)),
                                ),
                                new ListTile(
                                  leading: new Bullet(),
                                  title: new Text('Trolleybus Line 2, 8 or 9: bul Pencho Slaveykov Station', style: TextStyle(color: Colors.black, height: 1.5, fontSize: 15)),
                                )
                              ],
                            )
                          ],
                        )
                    ),
                  ],
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
                ),
                IconButton(
                  icon: Image.asset("assets/icons/iconmail.png"),
                  color: Colors.white,
                  iconSize: 40,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactUsMenu()),
                    );
                  },
                )
              ],
            ),
          ),
        )
    );
  }
}