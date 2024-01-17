import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

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

  static Future<bool> cadastrarUsuario() async {
    final urlPost = Uri.parse('http://localhost:8080/usuarios/cadastrar');

    final Map<String, dynamic> data = {
      "nome": "$user",
      "senha": "$passWord",
    };

    final response = await http.post(
      urlPost,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> isValidUser() async {
    if (passWord == repeatPassWord) {
      cadastrarUsuario();
      return true;
    } else {
      return false;
    }
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

  static Future<String> getNomeByServidor() async {
    final urlGet = Uri.parse('http://localhost:8080/usuarios/nome/$user');

    final response = await http.get(
      urlGet,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['nome'];
    } else {
      print('Erro na solicitação: ${response.statusCode}');
      return '';
    }
  }
}