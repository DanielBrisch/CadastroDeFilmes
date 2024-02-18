import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../../serverInfo.dart';

class MV_RegisterStore {
  static TextEditingController nome = TextEditingController();
  static TextEditingController descricao = TextEditingController();
  static int star = 0;
  static int restricao = 0;

  static File? imagemSelecionada;
  static final picker = ImagePicker();

  static Future<void> cadastrarFilme(context) async {
    final urlPost = Uri.parse('${ServerInfo.hostAPI}/filmes/cadastrar');

    List<int> imagemBytes = imagemSelecionada!.readAsBytesSync();
    String base64Image = base64Encode(imagemBytes);

    final Map<String, dynamic> data = {
      "nome": nome.text,
      "descricao": descricao.text,
      "restricao": restricao,
      "classificacao": star,
      "capaFilme": base64Image,
    };

    await http.post(urlPost,
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    Navigator.pop(context);
  }
}
