import 'package:flutter/material.dart';

class Versiculos extends StatefulWidget {
  const Versiculos({Key? key}) : super(key: key);

  @override
  _VersiculosState createState() => _VersiculosState();
}

class _VersiculosState extends State<Versiculos> {
  late List<Map<String, String>> versiculos;
  int indiceAtual = 0;

  @override
  void initState() {
    super.initState();

    versiculos = [
      {
        'texto':
            'Porque eu bem sei os planos que estou projetando para vós, diz o Senhor; planos de paz e não de mal, para vos dar um futuro e uma esperança.',
        'referencia': 'Jeremias 29:11',
      },
      {
        'texto':
            'Vós sois o sal da terra; mas se o sal se tornar insípido, com que se há de restaurar-lhe o sabor? para nada mais presta, senão para ser lançado fora, e ser pisado pelos homens.',
        'referencia': 'Mateus 5:13',
      },
      {
        'texto':
            'Diante disso, que vamos dizer? Se Deus é por nós, quem será contra nós?',
        'referencia': 'Romanos 8:31',
      },
      {
        'texto':
            'Amarás o Senhor teu Deus de todo o teu coração, de toda a tua alma e com toda a tua mente.',
        'referencia': 'Mateus 22:37',
      },
      {
        'texto':
            'Portanto, não vos preocupeis com o dia de amanhã; o dia de amanhã se preocupará consigo mesmo. Basta a cada dia sua pena.',
        'referencia': 'Mateus 6:34',
      },
      {
        'texto':
            'Não sou eu que te mando ser forte e corajoso? Não temas nem te apavores, pois Javé, teu Deus, estará contigo aonde quer que fores.',
        'referencia': 'Josué 1:9',
      },
      {
        'texto':
            'Assim que, se alguém está em Cristo, nova criatura é: as coisas velhas já passaram; eis que tudo se fez novo..',
        'referencia': '2 Coríntios 5:17',
      },
    ];

    exibirVersiculoAtual();
  }

  void exibirVersiculoAtual() {
    setState(() {});
  }

  void proximoVersiculo() {
    if (indiceAtual < versiculos.length - 1) {
      indiceAtual++;
      exibirVersiculoAtual();
    }
  }

  void versiculoAnterior() {
    if (indiceAtual > 0) {
      indiceAtual--;
      exibirVersiculoAtual();
    }
  }

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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Versículo Bíblico:',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 18.0),
            Text(
              versiculos[indiceAtual]['texto'] ?? 'Carregando versículo...',
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.black,
              ),
            ),
            Text(
              versiculos[indiceAtual]['referencia'] ??
                  'Carregando referência...',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: versiculoAnterior,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromRGBO(0, 0, 255, 1), // Fundo azul
                  ),
                  child: const Text(
                    'Anterior',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: proximoVersiculo,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromRGBO(0, 0, 255, 1), // Fundo azul
                  ),
                  child: const Text(
                    'Próximo',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
