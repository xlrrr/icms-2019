import 'package:flutter/material.dart';

class ScheduleMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 0.0),
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
                                    child: Text("Registration", textAlign: index % 2 == 0 ? TextAlign.left : TextAlign.right, style: TextStyle(color: Colors.white, fontSize: 20)),
                                  ),
                                ),
                                new Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  alignment: index % 2 != 0 ? Alignment.centerLeft: Alignment.centerRight,
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  color: Colors.transparent,
                                  child: Text("11:00 – 17:30", textAlign: index % 2 != 0 ? TextAlign.left : TextAlign.right, style: TextStyle(color: Colors.white70, fontSize: 15),),
                                ),
                                new Center(
                                  child: new Container(
                                    height: 150,
                                    width: 1.0,
                                    color: Colors.blue,
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
                          itemCount: 3,
                        ),
                      ),
                      new Container(
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
                                    child: Text("Registration", textAlign: index % 2 == 0 ? TextAlign.left : TextAlign.right, style: TextStyle(color: Colors.white, fontSize: 20)),
                                  ),
                                ),
                                new Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  alignment: index % 2 != 0 ? Alignment.centerLeft: Alignment.centerRight,
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  color: Colors.transparent,
                                  child: Text("11:00 – 17:30", textAlign: index % 2 != 0 ? TextAlign.left : TextAlign.right, style: TextStyle(color: Colors.white70, fontSize: 15),),
                                ),
                                new Center(
                                  child: new Container(
                                    height: 150,
                                    width: 1.0,
                                    color: Colors.blue,
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
                          itemCount: 3,
                        ),
                      ),
                      new Container(
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
                                    child: Text("Registration", textAlign: index % 2 == 0 ? TextAlign.left : TextAlign.right, style: TextStyle(color: Colors.white, fontSize: 20)),
                                  ),
                                ),
                                new Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  alignment: index % 2 != 0 ? Alignment.centerLeft: Alignment.centerRight,
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  color: Colors.transparent,
                                  child: Text("11:00 – 17:30", textAlign: index % 2 != 0 ? TextAlign.left : TextAlign.right, style: TextStyle(color: Colors.white70, fontSize: 15),),
                                ),
                                new Center(
                                  child: new Container(
                                    height: 150,
                                    width: 1.0,
                                    color: Colors.blue,
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
                          itemCount: 3,
                        ),
                      ),
                      new Container(
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
                                    child: Text("Registration", textAlign: index % 2 == 0 ? TextAlign.left : TextAlign.right, style: TextStyle(color: Colors.white, fontSize: 20)),
                                  ),
                                ),
                                new Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  alignment: index % 2 != 0 ? Alignment.centerLeft: Alignment.centerRight,
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  color: Colors.transparent,
                                  child: Text("11:00 – 17:30", textAlign: index % 2 != 0 ? TextAlign.left : TextAlign.right, style: TextStyle(color: Colors.white70, fontSize: 15),),
                                ),
                                new Center(
                                  child: new Container(
                                    height: 150,
                                    width: 1.0,
                                    color: Colors.blue,
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
                          itemCount: 3,
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
                )
              ],
            ),
          ),
        )
    );
  }
}