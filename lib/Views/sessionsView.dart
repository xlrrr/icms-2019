import 'package:flutter/material.dart';
import 'package:icms_bulgaria/Views/contactUsView.dart';
import 'package:icms_bulgaria/CustomWidgets/bullet.dart';

class SessionsMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
              ),
              new Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) =>
                      EntryItem(data[index]),
                  itemCount: data.length,
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
                      icon: Image.asset("assets/icons/iconlecturewhite.png"),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                    Text("Sessions", textAlign: TextAlign.center, style: TextStyle(height: 1.5, color: Colors.white, fontSize: 17),)
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


// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, this.bullet, this.depth, [this.children = const <Entry>[]]);

  final String title;
  final int depth;
  final Bullet bullet;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Oral Sessions',
    Bullet(),
    0,
    <Entry>[
      Entry(
        'Preclinic',
        Bullet(shape:BoxShape.circle, useLogoInstead: false),
        1,
        <Entry>[
          Entry('Session I', Bullet(shape:BoxShape.rectangle, useLogoInstead: false),2),
          Entry('Session II', Bullet(shape:BoxShape.rectangle, useLogoInstead: false),2),
          Entry('Session III', Bullet(shape:BoxShape.rectangle, useLogoInstead: false),2),
        ],
      ),
      Entry('Therapy',Bullet(shape:BoxShape.circle, useLogoInstead: false),1),
      Entry('Surgery', Bullet(shape:BoxShape.circle, useLogoInstead: false),1),
      Entry('Public Health', Bullet(shape:BoxShape.circle, useLogoInstead: false),1)
    ],
  ),
  Entry(
    'Poster Sessions',
    Bullet(),
    0,
    <Entry>[
      Entry('TBA', Bullet(shape:BoxShape.circle, useLogoInstead: false),1),
      Entry('TBA', Bullet(shape:BoxShape.circle, useLogoInstead: false),1),
    ],
  )
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return Card(
      child: ExpansionTile(
        leading: Container(child: root.bullet, padding: EdgeInsets.only(left: (root.depth * 30.0))),
        key: PageStorageKey<Entry>(root),
        title: Text(root.title, style: TextStyle(color: Colors.black45)),
        children: <Widget>[
          Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Expanded(child: Text(root.title, style: TextStyle(color: Colors.black, height: 2, fontSize: 25), textAlign: TextAlign.center))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Expanded(child: Text("имената на разработките и кой ще ги представя", style: TextStyle(color: Colors.black, height: 1.3, fontSize: 15), textAlign: TextAlign.center))
                      ],
                    ),
                  )
                ],
              )
          )
        ],
      ),
    );

    return Card(
      child: ExpansionTile(
        key: PageStorageKey<Entry>(root),
        leading: Container(child: root.bullet, padding: EdgeInsets.only(left: (root.depth * 30.0))),
        title: Text(root.title, style: TextStyle(color: Colors.black45)),
        children: root.children.map(_buildTiles).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}