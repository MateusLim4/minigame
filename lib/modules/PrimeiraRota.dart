import 'dart:async';

import 'package:ac3/themes/fonts.dart';
import 'package:ac3/widget/button.dart';
import 'package:ac3/widget/mario.dart';
import 'package:ac3/widget/mario_jump.dart';
import 'package:flutter/material.dart';

import 'Menu.dart';

class PrimeiraRota extends StatefulWidget {
  @override
  State<PrimeiraRota> createState() => _PrimeiraRotaState();
}

class _PrimeiraRotaState extends State<PrimeiraRota> {
  static double marioX = -1;
  static double marioY = 1;
  double time = 0;
  double height = 0;
  double initialHeight = marioY;
  String direction = 'right';
  bool midJump = false;
  String fimJogo = '';

  bool countDown = false;
  int gameTime = 10;
  int returnPage = 11;

  void countDownTime() {
    if (countDown == false) {
      countDown = true;
      runTime();
    }
  }

  void runTime() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (returnPage > 0) {
        setState(() {
          if (gameTime > 0) {
            gameTime -= 1;
          } else {
            (gameTime = 0);
            fimJogo = 'Fim de jogo';
          }
          returnPage -= 1;
        });
      } else {
        setState(() {
          timer.cancel();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Principal()));
        });
      }
    });
  }

  void preJump() {
    setState(() {
      time = 0;
      initialHeight = marioY;
    });
  }

  void jump() {
    midJump = true;
    countDownTime();
    preJump();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 5 * time;

      if (initialHeight - height > 1) {
        setState(() {
          midJump = false;
          setState(() {
            marioY = 1;
          });

          timer.cancel();
        });
      } else {
        setState(() {
          marioY = initialHeight - height;
        });
      }
    });
  }

  void moveRight() {
    countDownTime();
    direction = 'right';
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (ButtonAction().userIsHolding() == true && (marioX) < 1) {
        setState(() {
          marioX += 0.2;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void moveLeft() {
    countDownTime();
    direction = 'left';
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (ButtonAction().userIsHolding() == true && (marioX) > -1) {
        setState(() {
          marioX -= 0.2;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animação", style: Fonts.title),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                AnimatedContainer(
                    duration: Duration(microseconds: 0),
                    color: Colors.blue,
                    child: Container(
                      alignment: Alignment(marioX, marioY),
                      child: midJump
                          ? JumpingMario(
                              direction: direction,
                            )
                          : MarioModel(
                              direction: direction,
                            ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Pontos',
                            style: Fonts.subtitle,
                          ),
                          Text(
                            '0000',
                            style: Fonts.subtitle,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Mundo',
                            style: Fonts.subtitle,
                          ),
                          Text(
                            '1-1',
                            style: Fonts.subtitle,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Tempo',
                            style: Fonts.subtitle,
                          ),
                          Text(
                            '$gameTime',
                            style: Fonts.subtitle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                    child: Text(
                  fimJogo,
                  style: Fonts.endGame,
                  textAlign: TextAlign.center,
                ))
              ],
            ),
          ),
          Container(
            height: 10,
            color: Colors.green,
          ),
          Expanded(
            flex: 1,
            child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonAction(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      function: moveLeft,
                    ),
                    ButtonAction(
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                      ),
                      function: jump,
                    ),
                    ButtonAction(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        function: moveRight),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
