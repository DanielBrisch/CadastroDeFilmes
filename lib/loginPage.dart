import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            height: 470.0,
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
                const Spacer(),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(23, 0, 4, 5),
                      child: Image.asset(
                        "img/userIcon.jpg",
                        width: 30.0,
                        height: 30.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5, right: 160),
                      child: Text(
                        "User",
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset(
                        "img/padlock.jpg",
                        width: 30.0,
                        height: 30.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13.0))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.deepPurpleAccent),
                      elevation: MaterialStateProperty.all<double>(8.0),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
