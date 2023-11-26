import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                width: 360,
                height: 305,
              ),
              const SizedBox(height: 0),
              Container(
                width: 360,
                height: 67,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromRGBO(0, 0, 255, 1),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    style: const TextStyle(
                        color: Color.fromRGBO(128, 128, 128, 1)),
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(128, 128, 128, 1)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: 360,
                height: 67,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromRGBO(0, 0, 255, 1),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    obscureText: true,
                    style: const TextStyle(
                        color: Color.fromRGBO(128, 128, 128, 1)),
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(128, 128, 128, 1)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: 360,
                height: 67,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromRGBO(0, 0, 255, 1),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/inicial');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'inter',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
