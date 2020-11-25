import 'package:flutter/material.dart';
import 'package:gatilho/recursos/TemplatePrincipal.dart';

class CriarTarefa extends StatefulWidget {
  @override
  _CriarTarefaState createState() => _CriarTarefaState();
}

class _CriarTarefaState extends State<CriarTarefa> {
  @override
  Widget build(BuildContext context) {
    return TemplatePrincipal(titulo: "Criar tarefa",);
  }
}
