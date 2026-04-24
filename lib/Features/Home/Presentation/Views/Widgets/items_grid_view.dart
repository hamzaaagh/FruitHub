import 'package:flutter/material.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/best_seller_item.dart';

class ItemsGridView extends StatelessWidget {
  const ItemsGridView({super.key, required this.count});
  final int count; 
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: count,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 163 / 214,
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return BestSellerItem();
      },
    );
  }
}