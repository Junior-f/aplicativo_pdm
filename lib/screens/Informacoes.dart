import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Informacoes extends StatefulWidget {
  const Informacoes({Key? key}) : super(key: key);

  @override
  State<Informacoes> createState() => _InformacoesState();
}

class _InformacoesState extends State<Informacoes> {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<int> getTotalMembers() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('pessoas').get();
    return querySnapshot.size;
  }

  Future<int> getTotalMulheres() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('pessoas')
        .where('sexo', isEqualTo: 'feminino')
        .get();
    return querySnapshot.size;
  }

  Future<int> getTotalHomens() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('pessoas')
        .where('sexo', isEqualTo: 'masculino')
        .get();
    return querySnapshot.size;
  }

  Future<int> getTotalCriancas() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('pessoas')
        .where('idade', isLessThan: 16)
        .get();
    return querySnapshot.size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informacoes',
            style: TextStyle(fontSize: 20.0, color: Colors.white)),
        backgroundColor: const Color.fromRGBO(0, 0, 255, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBlueTextBox('Total Membros', getTotalMembers),
                  _buildBlueTextBox('Total Mulheres', getTotalMulheres),
                ],
              ),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBlueTextBox('Total Homens', getTotalHomens),
                  _buildBlueTextBox('Total Crianças', getTotalCriancas),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBlueTextBox(String label, Future<int> Function() dataFunction) {
    return FutureBuilder<int>(
      future: dataFunction(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // ou outro indicador de carregamento
        } else if (snapshot.hasError) {
          return Text('Erro ao obter dados: ${snapshot.error}');
        } else {
          return Container(
            width: 170.0,
            height: 141.0,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 0, 255, 1),
              border: Border.all(
                width: 1,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                Text(
                  snapshot.data.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
