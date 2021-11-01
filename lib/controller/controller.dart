import 'package:ac3/modules/Menu.dart';
import 'package:ac3/modules/PrimeiraRota.dart';
import 'package:ac3/modules/SegundaRota.dart';
import 'package:ac3/modules/TerceiraRota.dart';
import 'package:flutter/material.dart';

class RouteControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Navegação Básica',
        initialRoute: '/home',
        routes: {
          '/home': (context) => Principal(),
          '/game': (context) => PrimeiraRota(),
          '/info': (context) => SegundaRota(),
          '/team': (context) => TerceiraRota()
        });
  }
}
