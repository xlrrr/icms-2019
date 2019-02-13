import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icms_bulgaria/Views/splashScreen.dart';
import 'package:icms_bulgaria/Views/mainView.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ICMSApp());
  });
}

class ICMSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ICMS Bulgaria',
        theme: ThemeData(
          fontFamily: 'Helvetica',
          primarySwatch: Colors.blue,
        ),
        home: SplashMenu(),
        routes: <String, WidgetBuilder>{
          '/HomeScreen': (BuildContext context) => new MainMenu()
        },
    );
  }
}