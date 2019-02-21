import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:icms_bulgaria/Models/newsEntry.dart';
import 'package:icms_bulgaria/Views/contactUsView.dart';
import 'package:icms_bulgaria/Views/newsEntryView.dart';

Future<List<NewsEntry>> fetchNews() async {
  final response = await http.get('https://icmsbg.org/icms-mobile/news.php');

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<NewsEntry>((json) => NewsEntry.fromJson(json)).toList();
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load speakers');
  }
}

class NewsMenu extends StatelessWidget {
  final String title;

  NewsMenu({Key key, this.title}) : super(key: key);

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
              ),
              new Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: FutureBuilder<List<NewsEntry>>(
                  future: fetchNews(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);

                    return snapshot.hasData
                        ? NewsList(news: snapshot.data)
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
                      icon: Image.asset("assets/icons/iconnewswhite.png"),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                    Text("News", textAlign: TextAlign.center, style: TextStyle(height: 1.5, color: Colors.white, fontSize: 17),)
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

class NewsList extends StatelessWidget {
  final List<NewsEntry> news;

  NewsList({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return new Card(
          child: Container(
            child: ListTile(
              onTap: () => _onTapItem(context, news[index]),
              leading: new Container(
                  child: new CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(news[index].photoURL),
                    radius: 30.0,
                  ),
                  padding: const EdgeInsets.all(2.0), // border width
                  decoration: new BoxDecoration(
                    color: const Color(0xFF13909B), // border color
                    shape: BoxShape.circle,
                  )
              ),
              title: new Row(
                children: <Widget>[
                  new Expanded(child: Text(news[index].title, style: TextStyle(color: Colors.black),))
                ],
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
            ),
          ),
        );
      },
    );
  }

  void _onTapItem(BuildContext context, NewsEntry newsEntry) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewsEntryMenu(newsEntry: newsEntry)),
    );
  }
}