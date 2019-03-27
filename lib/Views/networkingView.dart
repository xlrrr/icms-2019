import 'package:flutter/material.dart';
import 'package:icms_bulgaria/Views/contactUsView.dart';

class NetworkingMenu extends StatelessWidget {

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
                              padding: EdgeInsets.all(5),
                              //padding: EdgeInsets.symmetric(vertical: 20),
                              child: Image.asset("assets/ace-the-case.png"),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text("Ace The Case - The Clinical Competition", style: TextStyle(color: Colors.black, height: 2, fontSize: 25), textAlign: TextAlign.center))
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text("Ace the Case is designed in the form of a social event and will take place at Peroto Coffee Shop on 11.05! It will start at 20:00. Make sure to be on time WITH your badge! The teams will be formed on first come - first serve basis.\nThe competition will be based on an application designed as an educative platform where students will get the chance to practice their clinical knowledge and decision-making skills. The competitors are divided into 20 teams of 5 members. Each team will have to efficiently diagnose 10 different patients in a limited amount of time. The efficiency is assessed based on: history taking abilities, correct choice of physical examinations performed, appropriate choice of lab tests, imaging and usage of other diagnostic tools.", style: TextStyle(color: Colors.black, height: 1.5, fontSize: 15), textAlign: TextAlign.center))
                                ],
                              ),
                            )
                          ],
                        )
                    ),
                    Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5),
                              //padding: EdgeInsets.symmetric(vertical: 20),
                              child: Image.asset("assets/thegala.png"),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text("The Cocktail", style: TextStyle(color: Colors.black, height: 2, fontSize: 25), textAlign: TextAlign.center))
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text("The cocktail will take place at the Registration Venue Place on the 2nd floor right after official opening ceremony. Participants will get the chance to introduce themselves, meet fellow colleagues and start making unforgettable memories.", style: TextStyle(color: Colors.black, height: 1.5, fontSize: 15), textAlign: TextAlign.center))
                                ],
                              ),
                            )
                          ],
                        )
                    )
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
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset("assets/icons/iconconnectwhite.png"),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                    Text("Networking", textAlign: TextAlign.center, style: TextStyle(height: 1.5, color: Colors.white, fontSize: 17),)
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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