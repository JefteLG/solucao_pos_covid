import 'package:flutter/material.dart';
import 'package:gatilho/recursos/TemplatePrincipal.dart';
import 'package:gatilho/recursos/TrabalharJson.dart';
import 'package:gatilho/rotas.dart';
import 'package:gatilho/telas/CriarRotina.dart';
import 'dart:convert';

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  List<Widget> rotinas = [Text("Carregando...")];

  @override
  void initState() {
    super.initState();
  }

  void listar() async {
    Map<String, dynamic> js = json.decode(await readData(context));
    rotinas = [];
    js["rotinas"].forEach((value) {
      rotinas.add(GestureDetector(
          onLongPress: () {
            showDialog(
                context: context,
                child: AlertDialog(
                  title: Text("Selecione uma operação"),
                  actions: [
                    FlatButton(
                      child: Text("Editar rotina"),
                      onPressed: () {
                        Navigator.pushNamed(context, EDITAR_ROTINA);
                      },
                    ),
                    FlatButton(
                      child: Text("Apagar rotina"),
                      onPressed: () {
                        showDialog(
                          context: context,
                          child: AlertDialog(
                            title: Text("Tem certeza?"),
                            content:
                                Text("Seus dados e tarefas serão perdidos"),
                            actions: [
                              FlatButton(
                                child: Text("Não"),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              ),
                              FlatButton(
                                child: Text("Sim"),
                                onPressed: () {
                                  //Todo, realizar a exclusão da rotina
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ));
          },
          onTap: () {
            Navigator.pushNamed(context, ROTINA, arguments: value);
          },
          child: Card(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(value["nome"]),
              ),
            ),
          )));
    });
  }

  @override
  Widget build(BuildContext context) {
    listar();
    return TemplatePrincipal(
      titulo: "Rotinas",
      fab: FloatingActionButton(
        onPressed: () async {
          Navigator.pushNamed(context, CRIAR_ROTINA);
        },
        child: Icon(Icons.add),
      ),
      filho: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: rotinas,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        ),
      )),
    );
  }
}
