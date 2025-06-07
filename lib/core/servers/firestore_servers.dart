import 'package:cloud_firestore/cloud_firestore.dart';

import 'database_server.dart';

class FirestoreServers extends DatabaseServer {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId}) async {
    var user = await firestore.collection(path).doc(documentId).get();
    return user.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> isDataExits(
      {required String path, required String documentId}) async {
    var doc = await firestore.collection(path).doc(documentId).get();
    return doc.exists;
  }
}
