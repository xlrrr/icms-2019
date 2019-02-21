import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:icms_bulgaria/Models/speaker.dart';
import 'package:icms_bulgaria/Views/contactUsView.dart';
import 'package:icms_bulgaria/Views/speakerView.dart';

Future<List<Speaker>> fetchSpeakers() async {
  final response = await http.get('https://icmsbg.org/icms-mobile/speakers.php');

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Speaker>((json) => Speaker.fromJson(json)).toList();
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load speakers');
  }
}

class SpeakersMenu extends StatelessWidget {
  final String title;

  SpeakersMenu({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
              children: <Widget>[Column(
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
              new Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: FutureBuilder<List<Speaker>>(
                  future: fetchSpeakers(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);

                    return snapshot.hasData
                        ? SpeakersList(speakers: snapshot.data)
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
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset("assets/icons/iconpeoplewhite.png"),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                    Text("Keynote\nspeakers", textAlign: TextAlign.center, style: TextStyle(height: 1.5, color: Colors.white, fontSize: 17),)
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

class SpeakersList extends StatelessWidget {
  final List<Speaker> speakers;

  SpeakersList({Key key, this.speakers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: speakers.length,
      itemBuilder: (context, index) {
        return new ListTile(
          onTap: () => _onTapItem(context, speakers[index]),
          leading: new Container(
              child: new CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(speakers[index].photoURL),
                radius: 30.0,
              ),
              padding: const EdgeInsets.all(2.0), // border width
              decoration: new BoxDecoration(
                color: const Color(0xFFFFFFFF), // border color
                shape: BoxShape.circle,
              )
          ),
          title: new Row(
            children: <Widget>[
              new Expanded(child: Text(speakers[index].name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))
            ],
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
        );
      },
    );
  }

  void _onTapItem(BuildContext context, Speaker speaker) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SpeakerMenu(speaker: speaker)),
    );
  }
}