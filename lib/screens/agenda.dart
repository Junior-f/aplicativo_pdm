import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Agenda extends StatelessWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              _buildTenRow(context),
              const SizedBox(height: 26.0),
              _buildTwentySixStack(context),
              const SizedBox(height: 16.0),
              const Divider(),
              const SizedBox(height: 48.0),
              SizedBox(
                height: 414.0,
                width: 325.0,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    _buildConsultasMarcadasStack(context),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 75.0),
                        child: SizedBox(
                          height: 413.0,
                          child: VerticalDivider(
                            width: 1.0,
                            thickness: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Agenda",
          style: TextStyle(fontSize: 20.0, color: Colors.white)),
      backgroundColor: const Color.fromRGBO(0, 0, 255, 1),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildTenRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  "Dez, 2023",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showMonthDropdown(context);
                },
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showMonthDropdown(BuildContext context) {
    List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Selecione o mês"),
          content: DropdownButton<String>(
            items: months.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? selectedMonth) {
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  Widget _buildTwentySixStack(BuildContext context) {
    return SizedBox(
      height: 62.0,
      width: 305.0,
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0.36, 0.0),
            child: Container(
              height: 62.0,
              width: 36.0,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 255, 1),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.0, right: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("D", style: TextStyle(fontSize: 16.0)),
                      Text("S", style: TextStyle(fontSize: 16.0)),
                      Text("T", style: TextStyle(fontSize: 16.0)),
                      Text("Q", style: TextStyle(fontSize: 16.0)),
                      Text("Q",
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.white)),
                      Text("S", style: TextStyle(fontSize: 16.0)),
                      Text("S", style: TextStyle(fontSize: 16.0)),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("19", style: TextStyle(fontSize: 16.0)),
                    Text("20", style: TextStyle(fontSize: 16.0)),
                    Text("21", style: TextStyle(fontSize: 16.0)),
                    Text("22", style: TextStyle(fontSize: 16.0)),
                    Text("23",
                        style: TextStyle(fontSize: 16.0, color: Colors.white)),
                    Text("24", style: TextStyle(fontSize: 16.0)),
                    Text("25", style: TextStyle(fontSize: 16.0)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConsultasMarcadasStack(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 371.0,
        width: 325.0,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(left: 95.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildCard(width: 242.0, height: 100.0),
                    const SizedBox(height: 13.0),
                    _buildCard(width: 242.0, height: 100.0),
                    const SizedBox(height: 13.0),
                    _buildCard(width: 242.0, height: 100.0),
                  ],
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 44.0),
                  Text("Abertura",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 105.0),
                  Text("Oferta",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 80.0),
                  Text(
                    "Pregação",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required double width, required double height}) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('pessoas').limit(3).get(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erro ao carregar dados do Firebase: ${snapshot.error}');
        } else {
          List<Widget> cards = [];
          int count = 0;

          for (QueryDocumentSnapshot document in snapshot.data!.docs) {
            if (count < 3) {
              String nome = document['nome'];
              cards.add(_buildCardItem(nome: nome));
              count++;
            } else {
              break;
            }
          }
          return Column(children: cards);
        }
      },
    );
  }

  Widget _buildCardItem({required String nome}) {
    return Container(
      width: 242.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(217, 217, 217, 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          nome,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
