import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetofilmes/Screens/register/register_store.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.deepPurpleAccent,
              ],
            ),
          ),
          child: Center(
            child: Container(
              width: 300.0,
              height: 500.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: Text(
                    "REGISTER",
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 5, right: 210),
                  child: Text(
                    "User",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: TextField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Digite aqui",
                        prefixIcon:
                            Icon(Icons.person, color: Colors.deepPurpleAccent),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepPurpleAccent),
                        ),
                      ),
                      controller: RegisterStore.user,
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 30),
                      child: Text(
                        "password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Digite aqui",
                        prefixIcon: const Icon(Icons.lock_person,
                            color: Colors.deepPurpleAccent),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepPurpleAccent),
                        ),
                        errorText: RegisterStore.passWord.text.isEmpty
                            ? 'Este campo é obrigatório.'
                            : null,
                      ),
                      controller: RegisterStore.passWord,
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 30),
                      child: Text(
                        "repeat password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Digite aqui",
                        prefixIcon: Icon(Icons.lock_person,
                            color: Colors.deepPurpleAccent),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepPurpleAccent),
                        ),
                      ),
                      controller: RegisterStore.repeatPassWord,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.deepPurpleAccent),
                      elevation: MaterialStateProperty.all<double>(8.0),
                    ),
                    onPressed: () async {
                        await RegisterStore.getNomeByServidor();
                    },
                    child: const Text(
                      "Cadastrar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
