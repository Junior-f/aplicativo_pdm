import 'package:aplicativo_pdm/routes/routes.dart';
import 'package:aplicativo_pdm/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const Login(),
      routes: routes,
    ),
  );
}

void navegarParaTela(BuildContext context, String rota) {
  Navigator.pushNamed(context, rota);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'aplicativo_pdm',
      debugShowCheckedModeBanner: false,
    );
  }
}
