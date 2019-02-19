import 'package:flutter/material.dart';
import 'package:icms_bulgaria/Views/contactUsView.dart';
import 'package:icms_bulgaria/CustomWidgets/bullet.dart';

class RegulationsMenu extends StatelessWidget {
  final String title;

  RegulationsMenu({Key key, this.title}) : super(key: key);

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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text("Oral Sessions", style: TextStyle(color: Colors.black, height: 2, fontSize: 35), textAlign: TextAlign.center))
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text("Oral Sessions are divided into the following thematic categories:", style: TextStyle(color: Colors.black, height: 1.6, fontSize: 20), textAlign: TextAlign.center))
                                ],
                              ),
                            ),
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 70),
                                  child: Column(
                                    children: <Widget>[
                                      new ListTile(
                                        leading: new Bullet(),
                                        title: new Text('Preclinical', style: TextStyle(color: Colors.black, height: 1.5, fontSize: 15)),
                                      ),
                                      new ListTile(
                                        leading: new Bullet(),
                                        title: new Text('Therapy', style: TextStyle(color: Colors.black, height: 1.5, fontSize: 15)),
                                      ),
                                      new ListTile(
                                        leading: new Bullet(),
                                        title: new Text('Surgery', style: TextStyle(color: Colors.black, height: 1.5, fontSize: 15)),
                                      ),
                                      new ListTile(
                                        leading: new Bullet(),
                                        title: new Text('Public Health', style: TextStyle(color: Colors.black, height: 1.5, fontSize: 15)),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text("Some of these sessions may take place at the same time in different lecture halls. You will receive information about which session you will be presenting in via email once your abstract has been reviewed by our Scientific Board and approved.\n\nEach Active Participant will be allowed a maximum of 8 minutes for the Presentation and 2 minutes for Questions and Discussion. Please do not exceed the allowed timeframe. There will be a crew member notifying you once you have 3 mins and 1 min left to conclude.\n\nWe accept presentations in the forms of: PowerPoint (preferably 2003).\n\nDuring each session a Scientific Jury will be present that will be evaluating your presentation using criteria such as: time management, presenting skills, quality of data, support of data, availability of statistical analysis etc.", style: TextStyle(color: Colors.black, height: 1.6, fontSize: 20), textAlign: TextAlign.center))
                                ],
                              ),
                            )
                          ],
                        )
                    ),
                    Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text("Poster Sessions", style: TextStyle(color: Colors.black, height: 2, fontSize: 35), textAlign: TextAlign.center))
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text("Poster Sessions are divided into the following thematic categories:", style: TextStyle(color: Colors.black, height: 1.6, fontSize: 20), textAlign: TextAlign.center))
                                ],
                              ),
                            ),
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 70),
                                  child: Column(
                                    children: <Widget>[
                                      new ListTile(
                                        leading: new Bullet(),
                                        title: new Text('Preclinical', style: TextStyle(color: Colors.black, height: 1.5, fontSize: 15)),
                                      ),
                                      new ListTile(
                                        leading: new Bullet(),
                                        title: new Text('Therapy', style: TextStyle(color: Colors.black, height: 1.5, fontSize: 15)),
                                      ),
                                      new ListTile(
                                        leading: new Bullet(),
                                        title: new Text('Surgery', style: TextStyle(color: Colors.black, height: 1.5, fontSize: 15)),
                                      ),
                                      new ListTile(
                                        leading: new Bullet(),
                                        title: new Text('Public Health', style: TextStyle(color: Colors.black, height: 1.5, fontSize: 15)),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text("The poster size should not exceed A0 format (height 120 cm, length 90 cm). Portrait size is preferable. You are required to print and bring your poster with you. No posters will be printed by the Organizing Committee.\n\nDuring the Poster Sessions your posters will be available on appropriate display surfaces. You are required to show up with your poster at least 10 mins before the beginning of the session, in order to display your poster under the assigned tags with your Active Participant ID number.\n\nYou will have a maximum of 5 minutes for your Presentation and 2 minutes for Questions and Discussion.\n\nThe Scientific Jury will evaluate your presentation and ability to answer questions as well as the overall layout and information provided on the poster. Other criteria will include: context, grammar, availability of figures and statistics, take-home messages, etc.", style: TextStyle(color: Colors.black, height: 1.6, fontSize: 20), textAlign: TextAlign.center))
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