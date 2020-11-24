// Bibliotecas necessárias
import 'package:flutter/material.dart';
import 'package:gatilho/telas/PaginaPrincipal.dart';

// Declaração das constantes que guardarão as rotas
const PAGINA_PRINCIPAL = '/';

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
