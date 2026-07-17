import 'package:flutter/material.dart';
import 'package:fruit_app/Core/entities/product_entity.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/best_seller_item.dart';

class ItemsGridView extends StatelessWidget {
  const ItemsGridView({super.key, required this.items});
  final List<ProductEntity> items;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.7,
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return BestSellerItem(product: items[index]);
      },
    );
  }
}
