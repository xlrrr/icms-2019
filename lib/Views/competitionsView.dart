import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:icms_bulgaria/Models/competition.dart';
import 'package:icms_bulgaria/Views/contactUsView.dart';

//Future<List<Competition>> fetchCompetitions() async {
//  final response = await http.get('https://icmsbg.org/icms-mobile/competitions.php');
//
//  if (response.statusCode == 200) {
//    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//    return parsed.map<Competition>((json) => Competition.fromJson(json)).toList();
//  } else {
//    // If that response was not OK, throw an error.
//    throw Exception('Failed to load speakers');
//  }
//}

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
                              child: Image.network(
                                'https://icmsbg.org/wp-content/uploads/2019/02/ICMS__awardsi-01.png',
                              ),
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
                                  new Expanded(child: Text("The OC of ICMS grants your excellent work with two major awards:\nBEST PRESENTATION AWARD – 500 €\nBEST POSTER AWARD – 500 €\nThe best Oral and Poster presentation in each category (Preclinic, Therapy, Surgery, Public Health) will compete during the Presentation Finals on 12.05!", style: TextStyle(color: Colors.black, height: 1.3, fontSize: 15), textAlign: TextAlign.center))
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
                              child: Image.network(
                                "https://www.elsevier.com/__data/assets/image/0007/182545/Elsevier-Foundation-Green-and-Sustainable-Chemistry-Challenge-1024x512.jpg"
                              ),
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
                                  new Expanded(child: Text("Tuka\nshte\nslojim\nmalko\ntext", style: TextStyle(color: Colors.black, height: 1.3, fontSize: 15), textAlign: TextAlign.center))
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

//class CompetitionsList extends StatelessWidget {
//  final List<Competition> competitions;
//
//  CompetitionsList({Key key, this.competitions}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return ListView.builder(
//      itemCount: competitions.length,
//      itemBuilder: (context, index) {
//        return Container(
//          child: Text(competitions[index].postContent, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, height: 1.5), textAlign: TextAlign.center,),
//        );
//      },
//    );
//  }
//}