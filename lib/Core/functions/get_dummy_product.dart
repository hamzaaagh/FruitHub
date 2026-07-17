import 'package:fruit_app/Core/entities/product_entity.dart';
import 'package:fruit_app/Core/utils/app_assets.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    code: "code",
    name: "بطيخ",
    price: 20,
    description: "description",
    imageUrl: Assets.assetsImagesPineapple,
    isFeatured: true,
    expirationMonths: 12,
    numberOfCalories: 29,
    unitAmounts: 20,
  );
}

List<ProductEntity> getDummyProducts(int count) {
  return List.generate(count, (index) => getDummyProduct());
}
