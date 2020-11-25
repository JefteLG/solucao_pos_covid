import 'package:flutter/material.dart';
import 'package:gatilho/recursos/TemplatePrincipal.dart';
import 'package:gatilho/rotas.dart';

class Rotina extends StatefulWidget {
  Map<String, dynamic> dados;

  Rotina(this.dados);

  @override
  _RotinaState createState() => _RotinaState();
}

class _RotinaState extends State<Rotina> {
  List<Widget> listar() {
    List<Widget> tarefas = [];
    widget.dados["tarefas"].forEach((value) {
      tarefas.add(GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, EDITAR_EXCLUIR_TAREFA);
          },
          child: Card(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(value["nome"]),
                    Checkbox(value: value["feito"], onChanged: (bool value) {
                      print(value);
                      //Todo, mudar depois para alterar no json
                    },)
                  ],
                ),
              ),
            ),
          )));
    });
    return tarefas;
  }

  @override
  Widget build(BuildContext context) {
    return TemplatePrincipal(
      titulo: widget.dados["nome"],
      fab: FloatingActionButton(
        onPressed: () async {
          Navigator.pushNamed(context, CRIAR_TAREFA);
        },
        child: Icon(Icons.add),
      ),
      filho: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: listar(),
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        ),
      )),
    );
  }
}
