import 'package:fruit_app/Core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 1});

  num calculateTotalPrice() {
    return productEntity.price * count;
  }

  num calculateTotalWeight() {
    return count;
  }

  void increaseCount([int amount = 1]) {
    count += amount;
  }

  void decreaseCount([int amount = 1]) {
    if (count > 1) {
      count -= amount;
    }
  }
}
