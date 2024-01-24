import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mv_register_store.dart';

class MV_RegisterPage extends StatefulWidget {
  const MV_RegisterPage({super.key});

  @override
  State<MV_RegisterPage> createState() => _MV_RegisterPageState();
}

class _MV_RegisterPageState extends State<MV_RegisterPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<bool> selectedYears = <bool>[false, false, false, false, false];

    const List<Widget> idades = <Widget>[
      Text('10'),
      Text('12'),
      Text('14'),
      Text('16'),
      Text('18'),
    ];

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
                  onPressed: () {},
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Icon(Icons.camera_alt),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: Text('*Clique para adicionar a capa do filme*'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      MV_RegisterStore.star = 1;
                    },
                    icon: const Icon(
                      Icons.star_rounded,
                      size: 50,
                    ),
                    color: Colors.grey,
                  ),
                  IconButton(
                    onPressed: () {
                      MV_RegisterStore.star = 2;
                    },
                    icon: const Icon(
                      Icons.star_rounded,
                      size: 50,
                    ),
                    color: Colors.grey,
                  ),
                  IconButton(
                    onPressed: () {
                      MV_RegisterStore.star = 3;
                    },
                    icon: const Icon(
                      Icons.star_rounded,
                      size: 50,
                    ),
                    color: Colors.grey,
                  ),
                  IconButton(
                    onPressed: () {
                      MV_RegisterStore.star = 4;
                    },
                    icon: const Icon(
                      Icons.star_rounded,
                      size: 50,
                    ),
                    color: Colors.grey,
                  ),
                  IconButton(
                    onPressed: () {
                      MV_RegisterStore.star = 5;
                    },
                    icon: const Icon(
                      Icons.star_rounded,
                      size: 50,
                    ),
                    color: Colors.grey,
                  ),
                ],
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nome',
                          style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        TextField(
                          decoration: InputDecoration(
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
                        child: Container(
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
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                    //nao funciona ainda (mas deveria
                  ToggleButtons(
                    isSelected: selectedYears,
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0; buttonIndex < selectedYears.length; buttonIndex++) {
                          if (buttonIndex == index) {
                            selectedYears[buttonIndex] = true;
                          } else {
                            selectedYears[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    children: idades
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: FloatingActionButton(
                        backgroundColor: Colors.deepPurpleAccent,
                        onPressed: () {},
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
}