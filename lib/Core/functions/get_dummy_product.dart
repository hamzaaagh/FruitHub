import 'package:fruit_app/Core/entities/product_entity.dart';
import 'package:fruit_app/Core/utils/app_assets.dart';
import 'package:fruit_app/Features/Cart/domain/entities/cart_item_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    code: "code",
    name: "أناناس",
    price: 20,
    description: "description",
    imageUrl: Assets.assetsImagesPineapple,
    isFeatured: true,
    expirationMonths: 12,
    numberOfCalories: 29,
    unitAmounts: 20,
  );
}

CartItemEntity getDummyCartItem() {
  return CartItemEntity(productEntity: getDummyProduct(), count: 1);
}


 

List<ProductEntity> getDummyProducts(int count) {
  return List.generate(count, (index) => getDummyProduct());
}

List<CartItemEntity> getDummyCartItems(int count) {
  return List.generate(count, (index) => getDummyCartItem());
}
