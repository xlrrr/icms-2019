import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsMenu extends StatelessWidget {

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
                children: <Widget>[
                  new Container(
                    margin: new EdgeInsets.only(left: 250.0),
                    child: Image.asset("assets/logo.png"),
                    padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                  )
                ],
              ),
              Center(child: Stack(
                children: <Widget>[
                  new Container(
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("assets/contactshexagon.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    child: Center(
                      child: IntrinsicWidth(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  onWebsiteTap();
                                },
                                child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 50),
                                        height: 42.0,
                                        width: 80.0,
                                        child: Image.asset("assets/icons/iconearthgradient.png"),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10, right: 50),
                                        height: 42.0,
                                        width: 180.0,
                                        child: Image.asset("assets/site.png"),
                                      ),
                                    ]
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  onFacebookTap();
                                },
                                child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 50),
                                        height: 42.0,
                                        width: 80.0,
                                        child: Image.asset("assets/icons/iconfbgradient.png"),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10, right: 50),
                                        height: 42.0,
                                        width: 150.0,
                                        child: Image.asset("assets/fbtwitter.png"),
                                      ),
                                    ]
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  onTwitterTap();
                                },
                                child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 50),
                                        height: 42.0,
                                        width: 80.0,
                                        child: Image.asset("assets/icons/icontwittergradient.png"),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10, right: 50),
                                        height: 42.0,
                                        width: 150.0,
                                        child: Image.asset("assets/fbtwitter.png"),
                                      ),
                                    ]
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  onEmailTap();
                                },
                                child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 50),
                                        height: 42.0,
                                        width: 80.0,
                                        child: Image.asset("assets/icons/iconmailgradient.png"),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10, right: 50),
                                        height: 42.0,
                                        width: 180.0,
                                        child: Image.asset("assets/mailcontacts icon.png"),
                                      ),
                                    ]
                                ),
                              )
                            ],
                          )
                      )
                    ),
                    margin: EdgeInsets.all(50),
                  )
                ],
              )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Container(
                    child: Image.asset("assets/landscapewhite.png"),
                    padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),)
                ],
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
                )
              ],
            ),
          ),
        )
    );
  }

  onWebsiteTap() async {
    const url = 'https://icmsbg.org';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  onFacebookTap() async {
    const url = 'fb://facewebmodal/ICMSBulgaria/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  onTwitterTap() async {
    const url = 'https://twitter.com/icmsbulgaria';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  onEmailTap() async {
    const url = 'mailto:info@icmsbg.org';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}