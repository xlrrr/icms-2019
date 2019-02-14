import 'package:flutter/material.dart';
import 'package:icms_bulgaria/CustomWidgets/HexagonButton.dart';
import 'package:icms_bulgaria/Views/contactUsView.dart';
import 'package:icms_bulgaria/Views/essentialInfoView.dart';
import 'package:icms_bulgaria/Views/speakersView.dart';
import 'package:icms_bulgaria/Views/scheduleView.dart';
import 'package:icms_bulgaria/Views/sessionsView.dart';
import 'package:icms_bulgaria/Views/networkingView.dart';
import 'package:icms_bulgaria/Views/workshopsView.dart';
import 'package:icms_bulgaria/Views/competitionsView.dart';
import 'package:icms_bulgaria/Views/newsView.dart';

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
        child: new Stack(
          children: <Widget>[
            Column(
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
            new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        new Container(
                          margin: new EdgeInsets.only(right: 0.0, bottom: 340.0),
                          child: HexagonButton(title:"Essential information",imageHighlighted: "assets/icons/iconideawhite.png", image: "assets/icons/iconideagradient.png",
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => EssentialInfoMenu()),
                                );
                              }),
                        ),
                        new Container(
                          margin: new EdgeInsets.only(right: 105.0, bottom: 160.0),
                          child: HexagonButton(title:"News",imageHighlighted: "assets/icons/iconnewswhite.png", image: "assets/icons/iconnewsgradient.png",
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => NewsMenu()),
                                );
                              }),
                        ),
                        new Container(
                          margin: new EdgeInsets.only(left: 105.0, bottom: 160.0),
                          child: HexagonButton(title:"Schedule",imageHighlighted: "assets/icons/iconcalendarwhite.png", image: "assets/icons/iconcalendargradient.png",
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ScheduleMenu()),
                                );
                              }),
                        ),
                        new Container(
                          margin: new EdgeInsets.only(right: 0.0, top: 20.0),
                          child: HexagonButton(title:"Sessions",imageHighlighted: "assets/icons/iconlecturewhite.png", image: "assets/icons/iconlecturegradient.png",
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SessionsMenu()),
                                );
                              }),
                        ),
                        new Container(
                          margin: new EdgeInsets.only(right: 210.0, top: 20.0),
                          child: HexagonButton(title: "Keynote speakers",imageHighlighted: "assets/icons/iconpeoplewhite.png", image: "assets/icons/iconpeoplegradient.png",
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SpeakersMenu()),
                                );
                              }),

                        ),
                        new Container(
                          margin: new EdgeInsets.only(left: 210.0, top: 20.0),
                          child: HexagonButton(title:"Workshops",imageHighlighted: "assets/icons/iconscalpelwhite.png", image: "assets/icons/iconscalpelgradient.png",
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => WorkshopsMenu()),
                                );
                              }),
                        ),
                        new Container(
                          margin: new EdgeInsets.only(right: 105.0, top: 200.0),
                          child: HexagonButton(title:"Networking",imageHighlighted: "assets/icons/iconconnectwhite.png", image: "assets/icons/iconconnectgradient.png",
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => NetworkingMenu()),
                                );
                              }),
                        ),
                        new Container(
                          margin: new EdgeInsets.only(left: 105.0, top: 200.0),
                          child: HexagonButton(title:"Competitions",imageHighlighted: "assets/icons/iconrankingwhite.png", image: "assets/icons/iconrankinggradient.png",
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CompetitionsMenu()),
                                );
                              }),
                        ),
                        new Container(
                          margin: new EdgeInsets.only(right: 0.0, top: 380.0),
                          child: HexagonButton(title: "Contact us", imageHighlighted: "assets/icons/iconearthwhite.png", image: "assets/icons/iconearthgradient.png",
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ContactUsMenu()),
                                );}),
                        ),
                      ],
                    )
                  ],
                )
            )
          ],
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              //IconButton(
              //  icon: Icon(Icons.home),
              //  iconSize: 40,
              //  color: Colors.white,
              //  onPressed: () {},
              //),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}