import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';

class SplashMenu extends StatefulWidget  {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashMenu> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  FirebaseMessaging _firebaseMessagin = new FirebaseMessaging();

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  void handler(status) {
    if (status == AnimationStatus.completed) {
      //_animation.removeStatusListener(handler);
      _controller.reset();
      _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ))..addStatusListener((status){
        if (status == AnimationStatus.completed) {
          _controller.reset();
          _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.fastOutSlowIn,
          ))..addStatusListener(handler);

          _controller.forward();
        }
      });
      _controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    _firebaseMessagin.configure(
      onMessage: (Map<String, dynamic> message)
      {
        print(message);
      },
      onResume: (Map<String, dynamic> message)
      {
        print(message);
      },
      onLaunch: (Map<String, dynamic> message)
      {
        print(message);
      },
    );

    _firebaseMessagin.getToken().then((token){
      print(token);
    });

    startTime();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ))..addStatusListener(handler);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    _controller.forward();
    return new Scaffold(
        body: new Container(
          decoration: new BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
              children: <Widget>[
                new Container(
                  child: Image.asset("assets/loadinglogo.png"),
                  padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
                ),
                AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget child) {
                      return new Center(
                          child: Container(
                            child: new CircleAvatar(
                              backgroundColor: Color(0xFF13909B),
                              radius: 30.0,
                            ),
                            width: 50.0,
                            height: 50.0,
                            color: Colors.transparent,
                            transform:Matrix4.translationValues(_animation.value * width, 110.0, 0.0)
                          ));
                    }),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Container(
                      child: Image.asset("assets/loadingpagelandscape.png"),
                      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),)
                  ],
                )
              ]
          ),
        )
    );
  }
}