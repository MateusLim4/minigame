import 'package:flutter/material.dart';

class ButtonAction extends StatelessWidget {
  final child;
  final function;
  static bool holdingDown = false;
  ButtonAction({this.child, this.function});

  bool userIsHolding() {
    return holdingDown;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        holdingDown = true;
        function();
      },
      onTapUp: (details) {
        holdingDown = false;
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.brown[300],
            child: child,
          )),
    );
  }
}
