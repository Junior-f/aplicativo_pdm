import 'package:aplicativo_pdm/screens/inicial.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
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
                          controller: _emailController,
                          style: const TextStyle(
                              color: Color.fromRGBO(128, 128, 128, 1)),
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(128, 128, 128, 1)),
                            border: InputBorder.none,
                          ),
                          validator: (email) {
                            if (email!.isEmpty) {
                              return 'Campo obrigatório';
                            } else if (!email.contains('@')) {
                              return 'Email inválido';
                            }
                            return null;
                          },
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
                          controller: _senhaController,
                          obscureText: true,
                          style: const TextStyle(
                              color: Color.fromRGBO(128, 128, 128, 1)),
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(128, 128, 128, 1)),
                            border: InputBorder.none,
                          ),
                          validator: (senha) {
                            if (senha!.isEmpty) {
                              return 'Campo obrigatório';
                            } else if (senha.length < 6) {
                              return 'Senha deve ter pelo menos 6 caracteres';
                            }
                            return null;
                          },
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
                          if (_formKey.currentState!.validate()) {
                            login();
                          }
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
                )),
          ),
        ),
      ),
    );
  }

  login() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _senhaController.text,
      );
      if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Inicial(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuário não encontrado'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Senha incorreta'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
