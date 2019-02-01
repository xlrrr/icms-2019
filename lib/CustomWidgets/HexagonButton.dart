import 'package:flutter/material.dart';

class HexagonButton extends StatelessWidget implements GestureDetector
{
  HexagonButton(String title)
  {
    m_title = title;
  }

  @override
  Widget build(BuildContext context) {

    return new Container(
      height: 110,
      width: 110,
      child: Stack(
          children: <Widget>[
            Center(child: Image.asset("assets/hexagonnormal.png")),
            Center(child: Text(m_title)),
          ]
      )
    );
  }

  @override
  // TODO: implement behavior
  HitTestBehavior get behavior => null;

  @override
  // TODO: implement child
  Widget get child => null;

  @override
  // TODO: implement excludeFromSemantics
  bool get excludeFromSemantics => null;

  @override
  // TODO: implement onDoubleTap
  get onDoubleTap => null;

  @override
  // TODO: implement onHorizontalDragCancel
  get onHorizontalDragCancel => null;

  @override
  // TODO: implement onHorizontalDragDown
  get onHorizontalDragDown => null;

  @override
  // TODO: implement onHorizontalDragEnd
  get onHorizontalDragEnd => null;

  @override
  // TODO: implement onHorizontalDragStart
  get onHorizontalDragStart => null;

  @override
  // TODO: implement onHorizontalDragUpdate
  get onHorizontalDragUpdate => null;

  @override
  // TODO: implement onLongPress
  get onLongPress => null;

  @override
  // TODO: implement onLongPressUp
  get onLongPressUp => null;

  @override
  // TODO: implement onPanCancel
  get onPanCancel => null;

  @override
  // TODO: implement onPanDown
  get onPanDown => null;

  @override
  // TODO: implement onPanEnd
  get onPanEnd => null;

  @override
  // TODO: implement onPanStart
  get onPanStart => null;

  @override
  // TODO: implement onPanUpdate
  get onPanUpdate => null;

  @override
  // TODO: implement onScaleEnd
  get onScaleEnd => null;

  @override
  // TODO: implement onScaleStart
  get onScaleStart => null;

  @override
  // TODO: implement onScaleUpdate
  get onScaleUpdate => null;

  @override
  // TODO: implement onTap
  get onTap => null;

  @override
  // TODO: implement onTapCancel
  get onTapCancel => null;

  @override
  // TODO: implement onTapDown
  get onTapDown => null;

  @override
  // TODO: implement onTapUp
  get onTapUp => null;

  @override
  // TODO: implement onVerticalDragCancel
  get onVerticalDragCancel => null;

  @override
  // TODO: implement onVerticalDragDown
  get onVerticalDragDown => null;

  @override
  // TODO: implement onVerticalDragEnd
  get onVerticalDragEnd => null;

  @override
  // TODO: implement onVerticalDragStart
  get onVerticalDragStart => null;

  @override
  // TODO: implement onVerticalDragUpdate
  get onVerticalDragUpdate => null;

  String m_title;

}