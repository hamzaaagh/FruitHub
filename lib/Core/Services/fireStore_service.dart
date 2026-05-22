import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_app/Core/Services/data_base_service.dart';

class FirestoreService implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> documentExists({
    required String path,
    required String documentId,
  }) async {
    var doc = await firestore.collection(path).doc(documentId).get();
    return doc.exists;
  }
}
