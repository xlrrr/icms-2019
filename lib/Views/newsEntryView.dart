import 'package:flutter/material.dart';
import 'package:icms_bulgaria/Models/newsEntry.dart';
import 'package:icms_bulgaria/Views/contactUsView.dart';

class NewsEntryMenu extends StatelessWidget {
  final NewsEntry newsEntry;

  NewsEntryMenu({Key key, this.newsEntry}) : super(key: key);

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
          child: new Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        new Container(
                          child: new CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(newsEntry.photoURL),
                            radius: 80.0,
                          ),
                          padding: const EdgeInsets.all(2.0), // borde width
                          decoration: new BoxDecoration(
                            color: const Color(0xFFFFFFFF), // border color
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(30.0),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Expanded(child: new Container(
                              child: Text(newsEntry.title, style: TextStyle(color: Colors.white,height: 1.5, fontWeight: FontWeight.bold, fontSize: 30), textAlign: TextAlign.center),
                              margin: EdgeInsets.only(bottom: 30.0, left: 10.0, right: 10.0),
                            )
                            )

                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Expanded(child: new Container(
                              child: Text(newsEntry.postContent, style: TextStyle(color: Colors.white,height: 1.5, fontWeight: FontWeight.bold, fontSize: 17), textAlign: TextAlign.center),
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                            )
                            )

                          ],
                        )
                      ],
                    )
                ),
              ),
            ],
          )),
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
            )
    ));
    }
}