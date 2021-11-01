import 'dart:math';

import 'package:flutter/material.dart';

class MarioModel extends StatelessWidget {
  final direction;
  MarioModel({this.direction});

  @override
  Widget build(BuildContext context) {
    if (direction == 'right') {
      return Container(
        height: 150,
        width: 150,
        alignment: Alignment(0, 1),
        child: Image.asset('assets/marioStoped.png'),
      );
    } else
      return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: Container(
            height: 150,
            width: 150,
            alignment: Alignment(0, 1),
            child: Image.asset('assets/marioStoped.png'),
          ));
  }
}
