import 'dart:convert';

import 'package:fruit_app/Core/Services/shared_prefrs_singelton.dart';
import 'package:fruit_app/Features/Auth/Data/Models/user_model.dart';
import 'package:fruit_app/Features/Auth/domain/entities/user_entity.dart';
import 'package:fruit_app/consts.dart';

UserEntity getUser() {
 var jsondata = SharedPrefrsSingelton.getString(kUserData);
 if (jsondata == null) {
   throw Exception('User data not found in local storage');
 }
 var userEntity = UserModel.fromMap(jsonDecode(jsondata));
 return userEntity;
}
