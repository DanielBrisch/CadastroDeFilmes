import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../../serverInfo.dart';

class MV_RegisterStore {

  static String nome = '';
  static String descricao = '';
  static int star = 0;
  static late int restricao;

  static Future<void> cadastrarFilme() async {
    final urlPost = Uri.parse('${ServerInfo.hostAPI}/filmes/cadastrar');

    final Map<String, dynamic> data = {
      "nome": nome,
      "descricao": descricao,
      "restricao": restricao,
      "classificacao": star,
      "capaFilme": '',
    };

    await http.post(urlPost, body: jsonEncode(data));
  }
}
