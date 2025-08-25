import 'package:flutter/material.dart';
import 'pages/ex1.dart';
import 'pages/pagina2.dart';
import 'pages/pagina3.dart';
import 'pages/pagina4.Dart';
import 'pages/pagina5.Dart';
import 'pages/pagina6.Dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Pagina1(),
        '/pagina2': (context) => Pagina2(),
        '/pagina3': (context) => Pagina3(),
        '/pagina4': (context) => Pagina4(),
        '/pagina5': (context) => Pagina5(),
        '/pagina6': (context) => Pagina6(),
      },
    );
  }
}
