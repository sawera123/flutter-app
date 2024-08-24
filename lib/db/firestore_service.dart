import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference clientCollection =
      FirebaseFirestore.instance.collection('client');

  // Add a client to Firestore
  Future<void> addClient({
    required String name,
    required String phone,
    required String childEmail,
    required String guardianEmail,
  }) async {
    try {
      await clientCollection.add({
        'name': name,
        'phone': phone,
        'childEmail': childEmail,
        'guardianEmail': guardianEmail,
      });
      print("Client added successfully!");
    } catch (e) {
      print("Failed to add client: $e");
    }
  }

  // Get all clients
  Stream<QuerySnapshot> getClients() {
    return clientCollection.snapshots();
  }
}
