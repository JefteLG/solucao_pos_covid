import 'package:flutter/material.dart';

class TemplatePrincipal extends StatefulWidget {
  Widget filho;

  String titulo;

  TemplatePrincipal({this.titulo, this.filho});

  @override
  _TemplatePrincipalState createState() => _TemplatePrincipalState();
}

class _TemplatePrincipalState extends State<TemplatePrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        backgroundColor: Colors.cyan,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.cyan, Colors.greenAccent])),
        ),
      ),
      body: widget.filho,
    );
  }
}
