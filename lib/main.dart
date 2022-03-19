// ignore_for_file: use_key_in_widget_constructors

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
