import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Avisos extends StatefulWidget {
  const Avisos({Key? key}) : super(key: key);

  @override
  _AvisosState createState() => _AvisosState();
}

class _AvisosState extends State<Avisos> {
  CollectionReference avisosCollection =
      FirebaseFirestore.instance.collection('avisos');

  List<AvisoCard> avisoCards = [];

  TextEditingController dataController = TextEditingController();
  TextEditingController horaController = TextEditingController();
  TextEditingController tituloController = TextEditingController();

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: avisosCollection.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    avisoCards = snapshot.data!.docs.map((document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;

                      return AvisoCard(
                        data: data,
                        docId: document.id,
                      );
                    }).toList();
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: avisoCards.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          avisoCards[index],
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
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
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Adicionar Aviso'),
                        content: Column(
                          children: [
                            TextField(
                              controller: dataController,
                              decoration: const InputDecoration(
                                labelText: 'Data',
                              ),
                            ),
                            TextField(
                              controller: horaController,
                              decoration: const InputDecoration(
                                labelText: 'Hora',
                              ),
                            ),
                            TextField(
                              controller: tituloController,
                              decoration: const InputDecoration(
                                labelText: 'Título',
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancelar',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 255, 1))),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await avisosCollection.add({
                                'data': dataController.text,
                                'hora': horaController.text,
                                'titulo': tituloController.text,
                                'aviso': '',
                              });

                              setState(() {
                                avisoCards.add(AvisoCard(
                                  data: {
                                    'data': dataController.text,
                                    'hora': horaController.text,
                                    'titulo': tituloController.text,
                                  },
                                  docId: '',
                                ));
                              });

                              dataController.clear();
                              horaController.clear();
                              tituloController.clear();

                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Adicionar',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 255, 1),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
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
              onPressed: () async {
                setState(() {
                  if (avisoCards.isNotEmpty) {
                    var lastCard = avisoCards.removeLast();
                    var docId = lastCard.docId;
                    avisosCollection.doc(docId).delete();
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
  final Map<String, dynamic> data;
  final String docId;

  const AvisoCard({Key? key, required this.data, required this.docId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: 360,
        height: 110,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(196, 196, 196, 1),
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Data: ${data['data']}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                'Hora: ${data['hora']}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                'Título: ${data['titulo']}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
