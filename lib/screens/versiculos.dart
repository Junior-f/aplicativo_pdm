import 'package:flutter/material.dart';

class Versiculos extends StatelessWidget {
  const Versiculos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Versículo',
            style: TextStyle(fontSize: 20.0, color: Colors.white)),
        backgroundColor: const Color.fromRGBO(0, 0, 255, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Versículo Bíblico:',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 18.0),
            Text(
              'Porque eu bem sei os planos que estou projetando para vós, diz o Senhor; planos de paz e não de mal, para vos dar um futuro e uma esperança.',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
              ),
            ),
            Text(
              '(Jeremias 29:11)',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
