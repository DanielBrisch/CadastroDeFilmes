import 'package:flutter/material.dart';
import '../home/home_page.dart';
import '../register/registerPage.dart';
import 'login_store.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
              width: 330.0,
              height: 450.0,
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
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5, left: 30),
                        child: Text(
                          "User",
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
                      width: size.width * 0.8,
                      height: 50,
                      child: TextField(
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Digite aqui",
                          prefixIcon: Icon(Icons.person,
                              color: Colors.deepPurpleAccent),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurpleAccent),
                          ),
                        ),
                        controller: _username,
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
                      width: size.width * 0.8,
                      height: 50,
                      child: TextField(
                        obscureText: true,
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
                        controller: _password,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shadowColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.deepPurpleAccent),
                        elevation: MaterialStateProperty.all<double>(8.0),
                      ),
                      onPressed: () async {
                        if (await LoginStore.getUserExist(_username.text, _password.text)) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const homePage()),
                          );
                        }
                      },
                      child: const Text(
                        "Entrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
