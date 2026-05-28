import 'package:fruit_app/Core/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  final int sellingCount;

  ProductModel({
    required super.name,
    required super.code,
    required super.price,
    required super.description,
    required super.isFeatured,
    required super.expirationMonths,
    required super.isOrganic,
    super.imageUrl,
    required super.numberOfCalories,
    required super.unitAmounts,
    this.sellingCount = 0, 
  });

  // 1. التابع المسؤول عن تحويل البيانات القادمة من السيرفر (Map) إلى Model
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'] as String,
      code: json['code'] as String,
      // تحويل السعر إلى double بشكل آمن سواء جاء من السيرفر كـ int أو double
      price: (json['price'] as num).toDouble(), 
      description: json['description'] as String,
      isFeatured: json['isFeatured'] as bool,
      expirationMonths: json['expirationMonths'] as int,
      isOrganic: json['isOrganic'] as bool,
      imageUrl: json['imageUrl'] as String?, // قد تكون الـ URL القادمة نال (null)
      numberOfCalories: json['numberOfCalories'] as int,
      unitAmounts: json['unitAmounts'] as int,
      // قراءة القيمة من السيرفر، وإذا لم تكن موجودة نضع القيمة الافتراضية صفر
      sellingCount: json['sellingCount'] as int? ?? 0, 
    );
  }

  // تحويل الـ Entity إلى Model قبل الرفع للسيرفر
  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      name: entity.name,
      code: entity.code,
      price: entity.price,
      description: entity.description,
      isFeatured: entity.isFeatured,
      expirationMonths: entity.expirationMonths,
      isOrganic: entity.isOrganic,
      imageUrl: entity.imageUrl,
      numberOfCalories: entity.numberOfCalories,
      unitAmounts: entity.unitAmounts,
      sellingCount: 0, 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "code": code,
      "price": price,
      "description": description,
      "isFeatured": isFeatured,
      "expirationMonths": expirationMonths,
      "isOrganic": isOrganic,
      "imageUrl": imageUrl, 
      "numberOfCalories": numberOfCalories,
      "unitAmounts": unitAmounts,
      "sellingCount": sellingCount, 
    };
  }
}