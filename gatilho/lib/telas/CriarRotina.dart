import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gatilho/recursos/TemplatePrincipal.dart';
import 'package:gatilho/recursos/TrabalharJson.dart';

class CriarRotina extends StatefulWidget {
  @override
  _CriarRotinaState createState() => _CriarRotinaState();
}

class _CriarRotinaState extends State<CriarRotina> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TemplatePrincipal(
      titulo: "Criar rotina",
      filho: Column(
        children: [
          TextField(
            controller: textEditingController,
          )
        ],
      ),
      fab: FloatingActionButton(
        onPressed: () async {
          readData(context).then((data) {
            Map<String, dynamic> dados = json.decode(data);
            dados["rotinas"].add(
                {"id": 5, "nome": textEditingController.text, "tarefas": []});
            saveData(dados);
          });
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
