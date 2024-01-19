import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetofilmes/serverInfo.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Bem Vindo de volta ${ServerInfo.user}',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.white,
        ),
      ),
    );
  }
}
