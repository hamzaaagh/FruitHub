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
  Future<dynamic> getData({
  required String path,
  String? documentId,
  Map<String, dynamic>? query,
}) async {
  // 1. إذا كان المطلوب مستند معين (Document)
  if (documentId != null) {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.data();
  }

  // 2. إذا كان المطلوب جلب مجموعة (Collection) مع شروط أو بدون
  // نبدأ بالمرجع الأساسي للمجموعة
  Query queryRef = firestore.collection(path);

  if (query != null) {
    // دعم فلترة البيانات (حقل، معامل، قيمة)
    // يتوقع تمريرها على شكل خريطة داخلية مثلاً: query['where'] = {'field': 'category', 'value': 'Electronics'}
    if (query["whereField"] != null && query["whereValue"] != null) {
      queryRef = queryRef.where(
        query["whereField"], 
        isEqualTo: query["whereValue"],
      );
    }

    // دعم الترتيب (يعمل الآن بالتزامن مع باقي الشروط)
    if (query["orderBy"] != null) {
      queryRef = queryRef.orderBy(
        query["orderBy"],
        descending: query["descending"] ?? false,
      );
    }

    // دعم تحديد العدد (يعمل الآن بالتزامن مع الترتيب والفلترة)
    if (query["limit"] != null) {
      queryRef = queryRef.limit(query["limit"]);
    }
  }

  // تنفيذ الاستعلام النهائي وجلب البيانات مرة واحدة للكل
  var snapshot = await queryRef.get();
  return snapshot.docs.map((doc) => doc.data()).toList();
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
