import 'package:fruit_app/Core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    code: "code",
    name: "بطيخ",
    price: 20,
    description: "description",
    imageUrl: "assets/images/fruit.svg",
    isFeatured: true,
    expirationMonths: 12,
    numberOfCalories: 29,
    unitAmounts: 20,
  ); 

}
List <ProductEntity> getDummyProducts(int count) {
  return List.generate(count, (index) => getDummyProduct());
}