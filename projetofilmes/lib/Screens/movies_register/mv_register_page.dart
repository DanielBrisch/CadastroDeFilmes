import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'mv_register_store.dart';

class MV_RegisterPage extends StatefulWidget {
  const MV_RegisterPage({super.key});

  @override
  State<MV_RegisterPage> createState() => _MV_RegisterPageState();
}

class _MV_RegisterPageState extends State<MV_RegisterPage> {
  @override
  void dispose() {
    MV_RegisterStore.nome.text = '';
    MV_RegisterStore.descricao.text = '';
    MV_RegisterStore.restricao = 0;
    MV_RegisterStore.star = 0;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Cadastro de Filme',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: 930,
          color: Colors.white,
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'CAPA DO FILME',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              SizedBox(
                  width: 220.0,
                  height: 250.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      escolherImagem();
                    },
                    child: MV_RegisterStore.imagemSelecionada != null
                        ? Image.file(MV_RegisterStore.imagemSelecionada!)
                        : const Icon(Icons.camera_alt),
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 25, bottom: 15),
                child: Text('*Clique para adicionar a capa do filme*'),
              ),
              iconStars(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nome',
                          style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Insira o nome do filme",
                            prefixIcon: Icon(Icons.create_sharp,
                                color: Colors.deepPurpleAccent),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.deepPurpleAccent),
                            ),
                          ),
                          controller: MV_RegisterStore.nome,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20, top: 10),
                        child: Text(
                          'Descrição',
                          style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 340,
                        child: SizedBox(
                          height: 150,
                          child: TextField(
                            maxLines: null,
                            expands: true,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Insira a descrição do filme",
                              alignLabelWithHint: false,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.deepPurpleAccent,
                                ),
                              ),
                            ),
                            controller: MV_RegisterStore.descricao,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  classificacao(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: FloatingActionButton(
                        backgroundColor: Colors.deepPurpleAccent,
                        onPressed: () {
                          MV_RegisterStore.cadastrarFilme(context);
                        },
                        child: const Text(
                          'SALVAR',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> escolherImagem() async {
    final pickedFile =
        await MV_RegisterStore.picker.pickImage(source: ImageSource.gallery);
    setState(() {
      MV_RegisterStore.imagemSelecionada =
          pickedFile != null ? File(pickedFile.path) : null;
    });
    await Future.delayed(const Duration(seconds: 1));
  }

  Row iconStars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        int starNumber = index + 1;
        Color starColor =
            MV_RegisterStore.star >= starNumber ? Colors.yellow : Colors.grey;

        return IconButton(
          icon: Icon(Icons.star, color: starColor, size: 50),
          onPressed: () {
            setState(() {
              MV_RegisterStore.star = starNumber;
            });
          },
        );
      }),
    );
  }

  Color _getButtonColor(int value) {
    return value == MV_RegisterStore.restricao
        ? _getActiveButtonColor(value)
        : Colors.grey;
  }

  Color _getActiveButtonColor(int value) {
    switch (value) {
      case 0:
        return Colors.green;
      case 10:
        return Colors.lightBlue;
      case 12:
        return Colors.yellow;
      case 14:
        return Colors.orange;
      case 16:
        return Colors.red;
      case 18:
        return Colors.black;
      default:
        return Colors.grey;
    }
  }

  Row classificacao() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int value in [0, 10, 12, 14, 16, 18])
          FloatingActionButton(
            onPressed: () {
              setState(() {
                MV_RegisterStore.restricao = value;
              });
            },
            foregroundColor: Colors.white,
            backgroundColor: _getButtonColor(value),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              value == 0 ? 'L' : value.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }
}
