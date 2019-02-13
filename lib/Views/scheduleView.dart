import 'package:flutter/material.dart';
import 'package:icms_bulgaria/Models/scheduleEntry.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:icms_bulgaria/Views/contactUsView.dart';

Future<List<ScheduleEntry>> fetchSchedule(String slug) async {

  //TODO find speakers in DB and return them instead (now returning some comments)
  final response = await http.get('https://icmsbg.org/icms-mobile/schedule.php?slug=' + slug);

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<ScheduleEntry>((json) => ScheduleEntry.fromJson(json)).toList();
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load speakers');
  }
}

class ScheduleMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(top:40),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/bluebg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: new Scaffold(
                  body: DefaultTabController(length: 4, child: TabBarView(
                    children: [
                      new Container(
                        child: FutureBuilder<List<ScheduleEntry>>(
                          future: fetchSchedule('day-one'),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) print(snapshot.error);

                            return snapshot.hasData
                                ? ScheduleList(scheduleEntries: snapshot.data)
                                : Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),));
                          },
                        ),
                      ),
                      new Container(
                        child: FutureBuilder<List<ScheduleEntry>>(
                          future: fetchSchedule('day-two'),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) print(snapshot.error);

                            return snapshot.hasData
                                ? ScheduleList(scheduleEntries: snapshot.data)
                                : Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),));
                          },
                        ),
                      ),
                      new Container(
                        child: FutureBuilder<List<ScheduleEntry>>(
                          future: fetchSchedule('day-three'),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) print(snapshot.error);

                            return snapshot.hasData
                                ? ScheduleList(scheduleEntries: snapshot.data)
                                : Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),));
                          },
                        ),
                      ),
                      new Container(
                        child: FutureBuilder<List<ScheduleEntry>>(
                          future: fetchSchedule('day-four'),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) print(snapshot.error);

                            return snapshot.hasData
                                ? ScheduleList(scheduleEntries: snapshot.data)
                                : Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),));
                          },
                        ),
                      ),
                    ],
                  )),
                  backgroundColor: Colors.transparent,
                ),
              )
            ]
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

class ScheduleList extends StatelessWidget {
  final List<ScheduleEntry> scheduleEntries;

  ScheduleList({Key key, this.scheduleEntries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(scheduleEntries[0].day, textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.white))
          ],
        ),
        Container(
          padding: EdgeInsets.only(top:35),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return new Stack(
                children: <Widget>[
                  new Container(
                    width: double.infinity,
                    height: 40.0,
                    alignment: index % 2 == 0 ? Alignment.centerLeft: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    color: Colors.transparent,
                    child: Container(
                      width: MediaQuery.of(context).size.width/2 - 80,
                      child: Text(scheduleEntries[index].name, textAlign: index % 2 == 0 ? TextAlign.left : TextAlign.right, style: TextStyle(color: Colors.white, fontSize: 20, height: 1.3)),
                    ),
                  ),
                  new Container(
                    width: double.infinity,
                    height: 40.0,
                    alignment: index % 2 != 0 ? Alignment.centerLeft: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    color: Colors.transparent,
                    child: Text(scheduleEntries[index].time, textAlign: index % 2 != 0 ? TextAlign.left : TextAlign.right, style: TextStyle(color: Colors.white70, fontSize: 15),),
                  ),
                  new Center(
                    child: new Container(
                      height: (index == scheduleEntries.length-1) ? 100 : 150,
                      width: 1.0,
                      color: (index == scheduleEntries.length-1) ? Colors.transparent : Colors.blue,
                    ),
                  ),
                  new Center(
                    child: new Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: new Container(
                        margin: new EdgeInsets.all(5.0),
                        height: 30.0,
                        width: 30.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              );
            },
            itemCount: scheduleEntries.length,
          ),
        )

      ],

    );
  }
}