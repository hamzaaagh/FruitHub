import 'package:flutter/material.dart';
import 'package:fruit_app/Core/entities/product_entity.dart';
import 'package:fruit_app/Features/Sections/Presentation/views/widgets/product_circle_item.dart';

class CircleProductsListView extends StatelessWidget {
  const CircleProductsListView({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110, // ارتفاع مناسب للـ Column الداخلي
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCircleItem(
            name: product.name,
            imagePath: product.imageUrl ?? '', // استخدم URL الصورة أو مسار افتراضي
            onTap: () {
              // الانتقال لصفحة المنتج أو الفلترة حسب الاختيار
              print('Selected: ${product.name}');
            },
          );
        },
      ),
    );
  }
}