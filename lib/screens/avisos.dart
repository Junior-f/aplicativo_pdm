import 'package:flutter/material.dart';

class Avisos extends StatefulWidget {
  const Avisos({Key? key}) : super(key: key);

  @override
  _AvisosState createState() => _AvisosState();
}

class _AvisosState extends State<Avisos> {
  List<Widget> avisoCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avisos',
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
        padding: const EdgeInsets.all(40.0),
        child: ListView.builder(
          itemCount: avisoCards.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                avisoCards[index],
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SizedBox(
              width: 50,
              height: 50,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    avisoCards.add(AvisoCard(key: UniqueKey()));
                  });
                },
                backgroundColor: const Color.fromRGBO(0, 0, 255, 1),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 50,
            height: 50,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (avisoCards.isNotEmpty) {
                    avisoCards.removeLast();
                  }
                });
              },
              backgroundColor: const Color.fromRGBO(0, 0, 255, 1),
              child: const Icon(Icons.remove, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class AvisoCard extends StatelessWidget {
  const AvisoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 100,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(196, 196, 196, 1),
        border: Border.all(
          width: 1,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Digite o aviso aqui',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
