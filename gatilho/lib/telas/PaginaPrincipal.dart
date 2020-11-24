import 'package:flutter/material.dart';
import 'package:gatilho/recursos/TemplatePrincipal.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return TemplatePrincipal(titulo: "Rotinas");
  }
}
