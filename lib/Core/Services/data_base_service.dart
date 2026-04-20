 abstract class DataBaseService {
Future<void> addData({required String path, required Map<String, dynamic> data, String? documentId});
Future<Map<String, dynamic>> getData({required String path, required String documentId});
Future<bool> documentExists({required String path, required String documentId});
}