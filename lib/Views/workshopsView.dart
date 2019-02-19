import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:icms_bulgaria/Models/workshop.dart';
import 'package:icms_bulgaria/Views/contactUsView.dart';

Future<List<Workshop>> fetchWorkshops() async {
  final response = await http.get('https://icmsbg.org/icms-mobile/workshops.php');

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Workshop>((json) => Workshop.fromJson(json)).toList();
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load speakers');
  }
}

class WorkshopsMenu extends StatelessWidget {
  final String title;

  WorkshopsMenu({Key key, this.title}) : super(key: key);

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
                child: FutureBuilder<List<Workshop>>(
                  future: fetchWorkshops(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);

                    return snapshot.hasData
                        ? WorkshopsList(workshops: snapshot.data)
                        : Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),));
                  },
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

class WorkshopsList extends StatelessWidget {
  final List<Workshop> workshops;

  WorkshopsList({Key key, this.workshops}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: workshops.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return new Card(
          margin: EdgeInsets.all(3),
          child : new GridTile(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                        child: new CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(workshops[index].photoURL),
                          radius: 40.0,
                        )
                    )
                  ]
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Expanded(child: Text(workshops[index].title, style: TextStyle(color: Colors.black, height: 2, fontSize: 15), textAlign: TextAlign.center))
                ],
              ),

            ],
          ),
            footer: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/icons/iconlocationgradient.png", height: 20,),
                      Text(workshops[index].place, style: TextStyle(color: Colors.black, fontSize: 11), textAlign: TextAlign.center)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/icons/iconcalendargradient.png", height: 20,),
                      Text(workshops[index].time, style: TextStyle(color: Colors.black, fontSize: 11), textAlign: TextAlign.center)
                    ],
                  )
                ],
              ),
            ),
        ),
        );
      },
    );
  }
}