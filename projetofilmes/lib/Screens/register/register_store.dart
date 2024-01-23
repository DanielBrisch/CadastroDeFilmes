import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:projetofilmes/serverInfo.dart';

class RegisterStore {

  static TextEditingController user = TextEditingController();
  static TextEditingController passWord = TextEditingController();
  static TextEditingController repeatPassWord = TextEditingController();

  static bool loginError = false;
  static bool passWordError = false;
  static bool repeatPassWordError = false;

  static Future<void> cadastrarUsuario() async {
    final urlPost = Uri.parse('${ServerInfo.hostAPI}/usuarios/cadastrar');

    final Map<String, dynamic> data = {
      "nome": user.text,
      "senha": passWord.text,
    };

    await http.post(urlPost, body: jsonEncode(data));
  }

  static Future<bool> isValidUser() async {
    if (await getNomeByServidor() == true) {
        return passWord.text == repeatPassWord.text;
      }
    return false;
  }

  static Future<bool> getNomeByServidor() async {
    if (user.text.isNotEmpty) {
      final urlGet = Uri.parse('${ServerInfo.hostAPI}/usuarios/nome/${user.text}');

      try {
        final response = await http.get(urlGet);

        return response.statusCode != 200;
      } catch (error) {
        return false;
      }
    }
    return false;
  }

}
