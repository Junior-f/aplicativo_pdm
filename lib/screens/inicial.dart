import 'package:aplicativo_pdm/screens/Informacoes.dart';
import 'package:aplicativo_pdm/screens/agenda.dart';
import 'package:aplicativo_pdm/screens/avisos.dart';
import 'package:aplicativo_pdm/screens/versiculos.dart';
import 'package:flutter/material.dart';

class Inicial extends StatelessWidget {
  const Inicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Inicial',
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
          backgroundColor: const Color.fromRGBO(0, 0, 255, 1),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Avisos()),
                      );
                    },
                    child: const CaixaDeTexto(
                        icon: Icons.notifications, texto: 'Avisos'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Informacoes()),
                      );
                    },
                    child: const CaixaDeTexto(
                        icon: Icons.info, texto: 'Informações'),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Versiculos()),
                      );
                    },
                    child: const CaixaDeTexto(
                        icon: Icons.book, texto: 'Versículos'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Agenda()),
                      );
                    },
                    child:
                        const CaixaDeTexto(icon: Icons.event, texto: 'Agenda'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CaixaDeTexto extends StatelessWidget {
  final IconData icon;
  final String texto;

  const CaixaDeTexto({Key? key, required this.icon, required this.texto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 141,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Text(
            texto,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
