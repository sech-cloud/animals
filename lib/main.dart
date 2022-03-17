import 'package:flutter/material.dart';
import 'Inicio.dart';

void main() {
  runApp(Animals());
}

class Animals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InicioApp(),
    );
  }
}
