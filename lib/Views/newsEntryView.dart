import 'package:flutter/material.dart';
import 'package:icms_bulgaria/Models/newsEntry.dart';
import 'package:icms_bulgaria/Views/contactUsView.dart';

class NewsEntryMenu extends StatelessWidget {
  final NewsEntry newsEntry;

  NewsEntryMenu({Key key, this.newsEntry}) : super(key: key);

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
                            new Container(
                              child: new CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(newsEntry.photoURL),
                                radius: 100.0,
                              ),
                              padding: const EdgeInsets.all(2.0), // border width
                              decoration: new BoxDecoration(
                                color: const Color(0xFF13909B), // border color
                                shape: BoxShape.circle,
                              ),
                              margin: EdgeInsets.all(15),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text(newsEntry.title, style: TextStyle(color: Colors.black, height: 2, fontSize: 35), textAlign: TextAlign.center))
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(child: Text(newsEntry.postContent, style: TextStyle(color: Colors.black, height: 1.6, fontSize: 20), textAlign: TextAlign.center))
                                ],
                              ),
                            )
                          ],
                        )
                    ),
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