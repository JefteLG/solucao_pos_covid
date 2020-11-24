import 'package:flutter/material.dart';
import 'package:gatilho/rotas.dart';

void main() {
  runApp(MaterialApp(
    title: "Título",
    theme: ThemeData(primaryColor: Colors.green),
    onGenerateRoute: rotas(),
  ));
}
