import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RegisterStore {

  TextEditingController nomeController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  Future<void> cadastrarUsuario() async {
    final url = Uri.parse('http://localhost:8080/api/pessoas');

    // Substitua os dados abaixo pelos dados reais do usuário que você deseja adicionar
    final Map<String, dynamic> data = {
      "nome": "Nome do Usuário",
      "senha": "Senha do Usuário",
    };

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('Usuário cadastrado com sucesso!');
    } else {
      print('Falha ao cadastrar usuário. Status code: ${response.statusCode}');
      print('Corpo da resposta: ${response.body}');
    }
  }

  void main() {
    cadastrarUsuario();
  }
}