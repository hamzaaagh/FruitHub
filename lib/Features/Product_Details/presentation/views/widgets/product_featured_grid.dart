// --- 5. الـ Widget الخاصة بشبكة مميزات المنتج ---
import 'package:flutter/material.dart';
import 'package:fruit_app/Core/entities/product_entity.dart';
import 'package:fruit_app/Features/Product_Details/presentation/views/widgets/featured_card.dart';

class ProductFeaturesGrid extends StatelessWidget {
  const ProductFeaturesGrid({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 2.2,
      children: [
        FeatureCard(
          title: "${product.expirationMonths.toString()} شهر",
          subtitle: 'الصلاحية',
          icon: Icon(Icons.calendar_today, color: Colors.blue, size: 30),
        ),
        FeatureCard(
          title: product.isOrganic ? '100%' : 'غير عضوي',
          subtitle: 'أورجانيك',
          icon: Icon(Icons.eco, color: Colors.green, size: 30),
        ),
        FeatureCard(
          title: "${product.numberOfCalories.toString()} كالوري",
          subtitle: '100 جرام',
          icon: Icon(
            Icons.local_fire_department,
            color: Colors.orange,
            size: 30,
          ),
        ),
        FeatureCard(
          title: '4.8 (256)',
          subtitle: 'Reviews',
          icon: Icon(Icons.star_border, color: Colors.amber, size: 30),
        ),
      ],
    );
  }
}
