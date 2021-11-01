import 'dart:math';

import 'package:flutter/material.dart';

class JumpingMario extends StatelessWidget {
  final direction;
  const JumpingMario({Key? key, this.direction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (direction == 'right') {
      return Container(
        height: 150,
        width: 150,
        alignment: Alignment(0, 1),
        child: Image.asset('assets/marioJump.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          height: 150,
          width: 150,
          alignment: Alignment(0, 1),
          child: Image.asset('assets/marioJump.png'),
        ),
      );
    }
  }
}
