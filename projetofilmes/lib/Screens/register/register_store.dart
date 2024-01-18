import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:projetofilmes/serverInfo.dart';

enum EmptyField {
  User,
  Password,
  RepeatPassword,
  None,
}

class RegisterStore {

  static TextEditingController user = TextEditingController();
  static TextEditingController passWord = TextEditingController();
  static TextEditingController repeatPassWord = TextEditingController();

  static Future<void> cadastrarUsuario() async {
    final urlPost = Uri.parse('${ServerInfo.hostAPI}/usuarios/cadastrar');

    final Map<String, dynamic> data = {
      "nome": user.text,
      "senha": passWord.text,
    };

    final response = await http.post(
      urlPost,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
  }

  static Future<bool> isValidUser() async {
    if (await getNomeByServidor() == true) {
        return passWord.text == repeatPassWord.text;
      }
    return false;
  }

  static Future<EmptyField> isEmptyTextField() async {
    if (user.text.isEmpty) {
      return EmptyField.User;
    } else if (passWord.text.isEmpty) {
      return EmptyField.Password;
    } else if (repeatPassWord.text.isEmpty) {
      return EmptyField.RepeatPassword;
    } else {
      return EmptyField.None;
    }
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
