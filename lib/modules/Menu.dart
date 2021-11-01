import 'package:ac3/modules/PrimeiraRota.dart';
import 'package:ac3/modules/SegundaRota.dart';
import 'package:ac3/modules/TerceiraRota.dart';
import 'package:ac3/themes/fonts.dart';
import 'package:ac3/widget/mario.dart';
import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      title: 'Desenvolvimento para Dispositivos Móveis',
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("AC03", style: Fonts.title),
          ),
          body: Column(children: [
            Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.blue,
                      alignment: Alignment(-1, 1),
                      child: MarioModel(
                        direction: 'right',
                      ),
                    ),
                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Escolha entre nossas 3 páginas!',
                                style: Fonts.title,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: size.height * 0.046),
                            Container(
                              child: Column(
                                children: [
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.red)),
                                      child: Text('Jogar',
                                          style: Fonts.buttonFont),
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/game');
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        child: Text(
                                          'Informações',
                                          style: Fonts.buttonFont,
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white)),
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/info');
                                        }),
                                  ),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      child: Text(
                                        'Grupo',
                                        style: Fonts.buttonFont,
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/team');
                                      }),
                                  SizedBox(
                                    height: 150,
                                  )
                                ],
                              ),
                            ),
                          ]),
                    )
                  ],
                )),
            Container(
              height: 10,
              color: Colors.green,
            ),
            Expanded(flex: 1, child: Container(color: Colors.brown)),
          ])),
    );
  }
}
