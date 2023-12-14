import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<String>> getPeopleNames() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('pessoas').get();

      List<String> names =
          querySnapshot.docs.map((doc) => doc['nome'] as String).toList();

      return names;
    } catch (e) {
      print("Error retrieving data: $e");
      return [];
    }
  }
}
