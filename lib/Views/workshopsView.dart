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

class WorkshopsMenu extends StatefulWidget {
  @override
  _WorkshopsMenuState createState() => _WorkshopsMenuState();
}

class _WorkshopsMenuState extends State<WorkshopsMenu> {

  TextEditingController editingController = TextEditingController();
  var filteredItems = List<Workshop>();
  var allItems = List<Workshop>();

  @override
  void initState() {
    fetchWorkshops().then((list){
      allItems.addAll(list);

      setState(() {
        filteredItems.clear();
        filteredItems.addAll(allItems);
      });
    });
    super.initState();
  }

  void filterSearchResults(String query) {
    filteredItems.clear();

    if(query.isNotEmpty) {
      var dummyDictData = List<Workshop>();
      allItems.forEach((workshop) {
        if(workshop.title.toLowerCase().contains(query.toLowerCase()))
        {
          dummyDictData.add(workshop);
        }
      });
      setState(() {
        filteredItems.clear();
        filteredItems.addAll(dummyDictData);
      });
      return;
    } else {
      setState(() {
        filteredItems.clear();
        filteredItems.addAll(allItems);
      });
    }
  }

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
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height:110,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
                    child: new Theme(
                      data: new ThemeData(
                          primaryColor: Colors.white30,
                          primaryColorDark: Colors.white12
                      ),
                      child: TextField(
                        onChanged: (value) {
                          filterSearchResults(value);
                        },
                        style: TextStyle(
                            color: Colors.white
                        ),
                        controller: editingController,
                        decoration: InputDecoration(
                          labelText: "Search",
                          labelStyle: TextStyle(
                              color: Colors.white
                          ),
                          prefixIcon: Icon(Icons.search, color: Colors.white,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.red, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.white, width: 2)),
                        ),
                        cursorColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                new Expanded(
                    child: Padding(padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
                      child: GridView.builder(
                          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemCount: filteredItems.length,
                          itemBuilder: (BuildContext context, int index) =>
                              WorkshopsItem(filteredItems[index])
                      )
                    )
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
                      icon: Image.asset("assets/icons/iconscalpelwhite.png"),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                    Text("Workshops", textAlign: TextAlign.center, style: TextStyle(height: 1.5, color: Colors.white, fontSize: 17),)
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

class WorkshopsItem extends StatelessWidget {
  final Workshop workshop;

  const WorkshopsItem(this.workshop);

  @override
  Widget build(BuildContext context) {
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
                        backgroundImage: NetworkImage(workshop.photoURL),
                        radius: 35.0,
                      )
                  )
                ]
            ),
            Container(
              child: Row(
                children: <Widget>[
                  new Expanded(child: Text(workshop.title, style: TextStyle(color: Colors.black, height: 1.5, fontSize: 14), textAlign: TextAlign.center))
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
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
                  Text(workshop.place, style: TextStyle(color: Colors.black, fontSize: 11), textAlign: TextAlign.center)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/icons/iconcalendargradient.png", height: 20,),
                  Text(workshop.time, style: TextStyle(color: Colors.black, fontSize: 11), textAlign: TextAlign.center)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}