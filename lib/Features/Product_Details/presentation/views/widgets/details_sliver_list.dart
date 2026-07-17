import 'package:flutter/material.dart';
import 'package:fruit_app/Core/entities/product_entity.dart';
import 'package:fruit_app/Features/Product_Details/presentation/views/widgets/product_descreption.dart';
import 'package:fruit_app/Features/Product_Details/presentation/views/widgets/product_featured_grid.dart';
import 'package:fruit_app/Features/Product_Details/presentation/views/widgets/product_rating_row.dart';
import 'package:fruit_app/Features/Product_Details/presentation/views/widgets/product_title_and_price_row.dart';

class DetailsList extends StatelessWidget {
  const DetailsList({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          // الاسم والسعر والكمية
          ProductTitleAndPriceRow(
            title: product.name,
            price: product.price,
          ),
          const SizedBox(height: 8),

          // التقييم والمراجعات
          const ProductRatingRow(),
          const SizedBox(height: 16),

          // الوصف
          ProductDescription(description: product.description),
          const SizedBox(height: 24),

          // شبكة المميزات (العام، العضوي، السعرات، التقييم)
          ProductFeaturesGrid(product: product),
        ]),
      ),
    );
  }
}
