import 'package:fruit_app/Core/Services/data_base_service.dart';
import 'package:fruit_app/Core/Services/fireStore_service.dart';
import 'package:fruit_app/Core/repos/product_repo.dart';
import 'package:fruit_app/Core/repos/product_repo_impl.dart';
import 'package:fruit_app/Features/Auth/Data/auth_repo_imp.dart';
import 'package:fruit_app/Core/Services/firebase_auth_service.dart'; // تأكد من الحروف الصغيرة

import 'package:fruit_app/Features/Auth/domain/repos/auth_repo.dart';
import 'package:fruit_app/Features/Cart/data/cart_repo_impl.dart';
import 'package:fruit_app/Features/Cart/domain/cart_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLoacator() {
  // 1. سجل الخدمة الأساسية أولاً
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DataBaseService>(FirestoreService());
  // 2. سجل الـ Implementation وحقن الخدمة بداخله
  // لاحظ هنا نربط الـ Interface (AuthRepo) بالـ Implementation (AuthRepoImpl) مباشرة
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      dataBaseService: getIt<DataBaseService>(), // تأكد من تسجيل DataBaseService أيضاً
    ),
  );
  getIt.registerSingleton<ProductRepo>(ProductRepoImpl(dataBaseService: getIt<DataBaseService>()));
   getIt.registerSingleton<CartRepo>(CartRepoImpl(dataBaseService: getIt<DataBaseService>()));
}