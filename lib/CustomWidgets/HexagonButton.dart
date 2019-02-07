import 'package:flutter/material.dart';

class HexagonButton extends StatefulWidget
{
  final String title;
  final String image;
  final String imageHighlighted;

  const HexagonButton({Key key, this.title, this.image, this.imageHighlighted, this.onPressed}) : super(key: key);

  @override
  HexagonButtonState createState() => HexagonButtonState();

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

class HexagonButtonState extends State<HexagonButton>
{
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTapDown: _tapDown,
        onTapUp: _tapUp,
        onTap: _onTap,
        onTapCancel: _tapCancel,
        child: new Container(
            height: 110,
            width: 110,
            child: Center(
                child: Stack(
                    children: <Widget>[
                      Center(child: Image.asset(m_isTapping ? "assets/hexagonactive.png" : "assets/hexagonnormal.png", gaplessPlayback: true)),
                      Center(child: new Container(
                          child: FlatButton(
                            onPressed: null,
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(m_isTapping ? widget.imageHighlighted : widget.image,width: 40,height: 40, gaplessPlayback: true),
                                Center(child: Text(widget.title, textAlign: TextAlign.center, style: TextStyle(color: m_isTapping ? Colors.white : Color(0xFF13909B)),))
                              ],
                            ),
                          )
                      )
                      )
                    ]
                )
            )
        )
    );
  }

  void _tapDown(TapDownDetails details) {
    setState(() {
      m_isTapping = true;
    });
  }

  void _tapUp(TapUpDetails details) {
    setState(() {
      m_isTapping = false;
    });
  }

  void _tapCancel() {
    setState(() {
      m_isTapping = false;
    });
  }

  void _onTap() {
    //open another page
    widget.onPressed();
  }

  bool m_isTapping = false;
}