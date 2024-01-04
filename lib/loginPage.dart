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
              Colors.blue,
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: 300.0,
            height: 470.0,
            decoration: BoxDecoration(
              color: Colors.blue,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
                ]),
          ),
        ),
      ),
    );
  }
}
