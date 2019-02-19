import 'package:flutter/material.dart';
import 'package:icms_bulgaria/Views/contactUsView.dart';

class CompetitionsMenu extends StatelessWidget {
  final String title;

  CompetitionsMenu({Key key, this.title}) : super(key: key);

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
                              child: Image.asset("assets/awardsi.png"),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text("Scientific Competition", style: TextStyle(color: Colors.black, height: 2, fontSize: 25), textAlign: TextAlign.center))
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text("The OC of ICMS grants your excellent work with two major awards:\nBEST PRESENTATION AWARD – 500 €\nBEST POSTER AWARD – 500 €\nThe best Oral and Poster presentation in each category (Preclinic, Therapy, Surgery, Public Health) will compete during the Presentation Finals on 12.05!", style: TextStyle(color: Colors.black, height: 1.5, fontSize: 15), textAlign: TextAlign.center))
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
                              child: Image.asset("assets/awardsi.png"),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text("The Elsevier Challenge", style: TextStyle(color: Colors.black, height: 2, fontSize: 25), textAlign: TextAlign.center))
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text("Tuka\nshte\nslojim\nmalko\ntext\ni nqkva snimka nali", style: TextStyle(color: Colors.black, height: 1.5, fontSize: 15), textAlign: TextAlign.center))
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