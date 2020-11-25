// Bibliotecas necessárias
import 'package:flutter/material.dart';
import 'package:gatilho/telas/CriarTarefa.dart';
import 'package:gatilho/telas/EditarOuExcluir.dart';
import 'package:gatilho/telas/EditarRotina.dart';
import 'package:gatilho/telas/PaginaPrincipal.dart';
import 'package:gatilho/telas/CriarRotina.dart';
import 'package:gatilho/telas/Rotina.dart';
import 'package:gatilho/telas/Teste.dart';

// Declaração das constantes que guardarão as rotas
const PAGINA_PRINCIPAL = '/';
const CRIAR_ROTINA = '/rotina/criar';
const ROTINA = '/rotina';
const EDITAR_ROTINA = '/rotina/editar';
const EDITAR_EXCLUIR_TAREFA = '/tarefa/editar/excluir';
const CRIAR_TAREFA = '/tarefa/criar';

/*
* #####        COMO CHAMAR AS ROTAS         #####
* Navigator.pushNamed(context, PaginaPrincipal);
*
* ##### COMO CHAMAR AS ROTAS COM ARGUMENTOS #####
* Navigator.pushNamed(context, PaginaPrincipal, arguments: {"chave": "dados"});
*
* ##### COMO CHAMAR AS ROTAS PASSANDO JSON  #####
* Navigator.pushNamed(context, PaginaPrincipal, arguments: jsonDecode(dados));
* */

// Fábrica de rotas
RouteFactory rotas() {
  return (config) {
    Widget tela;
    final Map<String, dynamic> argumentos = config.arguments;
    switch (config.name) {
      case PAGINA_PRINCIPAL:
        tela = PaginaPrincipal();
//        tela = Home();
        break;
      case CRIAR_ROTINA:
        tela = CriarRotina();
        break;
      case ROTINA:
        tela = Rotina(argumentos);
        break;
      case EDITAR_EXCLUIR_TAREFA:
        tela = EditarOuExcluir();
        break;
      case CRIAR_TAREFA:
        tela = CriarTarefa();
        break;
      case EDITAR_ROTINA:
        tela = EditarRotina();
        break;
//      Caso precise de argumentos
//      case OUTRA_SITUACAO:
//        if (argumentos["posicao"] != null)
//          tela = OutraPagina();
//        else
//          tela = OutraPagina();
//        break;
    }
    return MaterialPageRoute(builder: (BuildContext contexto) => tela);
  };
}
