import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetofilmes/serverInfo.dart';
import 'package:http/http.dart' as http;

class PreviewPageState {
  static String imagem = '';

  static Future<String> getArgsFilms() async {
    final urlGet = Uri.parse('${ServerInfo.hostAPI}/filmes/allFilmes');

    final response = await http.get(urlGet);

    final jsonResponse = jsonDecode(response.body);

    imagem = jsonResponse['capaFilme'];

    return response.body;
  }

  static SizedBox filmPreview() {
    return SizedBox(
      width: 200,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.network(imagem)],
      ),
    );
  }
}
