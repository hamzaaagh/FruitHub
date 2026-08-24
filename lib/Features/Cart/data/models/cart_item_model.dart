import 'package:fruit_app/Core/models/product_model.dart';
import 'package:fruit_app/Features/Cart/domain/entities/cart_item_entity.dart';


class CartItemModel {
  final ProductModel productModel;
  final int count;

  CartItemModel({required this.productModel, required this.count});

  // تحويل البيانات من CartItemEntity إلى CartItemModel
  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(
      productModel: ProductModel.fromEntity(entity.productEntity),
      count: entity.count,
    );
  }

  // تحويل بيانات CartItemModel إلى Entity لاستخدامها في UI والـ Domain
  CartItemEntity toEntity() {
    return CartItemEntity(productEntity: productModel, count: count);
  }

  // تحويل القادم من Firestore (Map) إلى CartItemModel
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      // التعديل هنا: استخدام 'product' لتطابق المفتاح في Firestore
      productModel: ProductModel.fromJson(
        json['product'] as Map<String, dynamic>,
      ),
      count: json['count'] as int,
    );
  }

  // تحويل الـ Model إلى Map لرفعه على Firestore
  Map<String, dynamic> toJson() {
    return {
      // التعديل هنا: الرفع بـ 'product' بدلاً من 'productData'
      'product': productModel.toJson(),
      'count': count,
    };
  }
}
