import 'package:flutter/material.dart';

class Informacoes extends StatelessWidget {
  const Informacoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações',
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
                  _buildBlueTextBox('Total Membros', '98'),
                  _buildBlueTextBox('Total Mulheres', '40'),
                ],
              ),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBlueTextBox('Total Homens', '35'),
                  _buildBlueTextBox('Total Crianças', '23'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBlueTextBox(String label, String value) {
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
            value,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 48.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
