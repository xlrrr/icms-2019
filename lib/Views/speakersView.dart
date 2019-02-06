import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:icms_bulgaria/Models/speaker.dart';

Future<List<Speaker>> fetchSpeakers() async {

  //TODO find speakers in DB and return them instead (now returning some comments)
  final response = await http.get('https://icmsbg.org/icms-mobile/mobile.php');

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
        body: FutureBuilder<List<Speaker>>(
          future: fetchSpeakers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? SpeakersList(speakers: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
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
                  icon: Icon(Icons.home),
                  iconSize: 40,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.mail),
                  color: Colors.white,
                  iconSize: 40,
                  onPressed: () {},
                ),
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
        return ListTile(
          title: Text(speakers[index].name),
          subtitle: Text(speakers[index].name),
          onTap: () => _onTapItem(context, speakers[index]),
        );
      },
    );
  }

  void _onTapItem(BuildContext context, Speaker speaker) {
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text(speaker.id.toString() + ' - ' + speaker.name), duration: Duration(milliseconds: 1),));
  }
}