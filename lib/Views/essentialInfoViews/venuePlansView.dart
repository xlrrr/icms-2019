import 'package:flutter/material.dart';
import 'package:icms_bulgaria/Views/contactUsView.dart';
import 'package:flutter/services.dart';

class VenuePlansMenu extends StatefulWidget {

  @override
  _VenuePlansMenuState createState() => _VenuePlansMenuState();
}

class _VenuePlansMenuState extends State<VenuePlansMenu> {

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
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
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) =>
                      Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Expanded(child: Text("Floor ${(index+1)}" , style: TextStyle(color: Colors.black, height: 2, fontSize: 25), textAlign: TextAlign.center))
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                //padding: EdgeInsets.symmetric(vertical: 20),
                                child: Image.asset("assets/floor${(index+1)}.png"),
                              )
                            ],
                          )
                      ),
                  itemCount: 4,
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
                      icon: Image.asset("assets/icons/iconbuildingwhite.png"),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                    Text("Venue plans", textAlign: TextAlign.center, style: TextStyle(height: 1.5, color: Colors.white, fontSize: 17),)
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