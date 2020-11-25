import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future<File> getFile() async {
  final directory = await getApplicationDocumentsDirectory();
  return File("${directory.path}/dadossssss.json");
}

Future<File> saveData(Map<String, dynamic> dados) async {
  String data = json.encode(dados);

  final file = await getFile();
  return file.writeAsString(data);
}

Future<String> readData(BuildContext context) async {
  try {
    File file = await getFile();
    if (!(await file.exists())) {
      saveData(await json.decode(await DefaultAssetBundle.of(context)
          .loadString("assets/dados.json")));
      File file = await getFile();
    }
    return file.readAsString();
  } catch (e) {
    return null;
  }
}
