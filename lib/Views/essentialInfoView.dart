import 'package:flutter/material.dart';
import 'package:icms_bulgaria/CustomWidgets/HexagonButton.dart';
import 'package:icms_bulgaria/Views/contactUsView.dart';
import 'package:icms_bulgaria/Views/essentialInfoViews/certificationView.dart';
import 'package:icms_bulgaria/Views/essentialInfoViews/transportationView.dart';
import 'package:icms_bulgaria/Views/essentialInfoViews/registrationView.dart';
import 'package:icms_bulgaria/Views/essentialInfoViews/speakerPreviewView.dart';
import 'package:icms_bulgaria/Views/essentialInfoViews/regulationsView.dart';
import 'package:icms_bulgaria/Views/essentialInfoViews/congressLocationView.dart';

class EssentialInfoMenu extends StatelessWidget {
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
                          child: HexagonButton(title:"Congress location",imageHighlighted: "assets/icons/iconlocationwhite.png", image: "assets/icons/iconlocationgradient.png",
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CongressLocationMenu()),
                                );
                              }),
                        ),
                        new Container(
                          margin: new EdgeInsets.only(right: 105.0, bottom: 160.0),
                          child: HexagonButton(title:"Transportation",imageHighlighted: "assets/icons/iconcarwhite.png", image: "assets/icons/iconcargradient.png",
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => TransportationMenu()),
                                );
                              }),
                        ),
                        new Container(
                          margin: new EdgeInsets.only(left: 105.0, bottom: 160.0),
                          child: HexagonButton(title:"Registration",imageHighlighted: "assets/icons/iconpenwhite.png", image: "assets/icons/iconpengradient.png",
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RegistrationMenu()),
                                );
                              }),
                        ),
                        new Container(
                          margin: new EdgeInsets.only(right: 0.0, top: 20.0),
                          child: new Container(
                              height: 115,
                              width: 115,
                              child: Center(
                                  child: Stack(
                                      children: <Widget>[
                                        Center(child: Image.asset("assets/hexagonstatic.png")),
                                        Center(child: new Container(
                                            child: FlatButton(
                                              onPressed: null,
                                              padding: EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Image.asset("assets/icons/iconinfogradient.png" ,width: 40,height: 40, gaplessPlayback: true),
                                                  Center(child: Column(
                                                    children: <Widget>[
                                                      Text("Information", textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF13909B), fontSize: 15),),
                                                      Text("for active participants", textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF13909B), fontSize: 10),)
                                                    ],
                                                  ))
                                                ],
                                              ),
                                            )
                                        )
                                        )
                                      ]
                                  )
                              )
                          )
                        ),
                        new Container(
                          margin: new EdgeInsets.only(right: 210.0, top: 20.0),
                          child: HexagonButton(title: "Certification",imageHighlighted: "assets/icons/iconscrollwhite.png", image: "assets/icons/iconscrollgradient.png",
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CertificationMenu()),
                                );
                              }),

                        ),
                        new Container(
                          margin: new EdgeInsets.only(left: 210.0, top: 20.0),
                          child: HexagonButton(title:"Venue plans",imageHighlighted: "assets/icons/iconbuildingwhite.png", image: "assets/icons/iconbuildinggradient.png"),
                        ),
                        new Container(
                          margin: new EdgeInsets.only(right: 80.0, top: 185.0),
                          child: HexagonButton(title:"Speaker preview",imageHighlighted: "assets/icons/iconklamerwhite.png", image: "assets/icons/iconklamergradient.png", size: 80,
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SpeakerPreviewMenu()),
                                );
                              }),
                        ),
                        new Container(
                          margin: new EdgeInsets.only(left: 80.0, top: 185.0),
                          child: HexagonButton(title:"Regulations",imageHighlighted: "assets/icons/iconlistwhite.png", image: "assets/icons/iconlistgradient.png", size: 80, onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegulationsMenu()),
                            );
                          }),
                        )
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
                    icon: Image.asset("assets/icons/iconideawhite.png"),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                  Text("Essential\ninformation", textAlign: TextAlign.center, style: TextStyle(height: 1.5, color: Colors.white, fontSize: 17),)
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}