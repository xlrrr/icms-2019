import 'package:flutter/material.dart';

class Bullet extends StatelessWidget{
  const Bullet({Key key, this.useLogoInstead = true, this.color = const Color(0xFF13909B), this.shape = BoxShape.circle});

  final Color color;
  final bool useLogoInstead;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 20.0,
      width: 20.0,
      decoration: !useLogoInstead ? new BoxDecoration(
        color: color,
        shape: shape,
      ) : null,
      child: useLogoInstead ? Image.asset("assets/icons/appIcon.png") : null,
    );
  }
}