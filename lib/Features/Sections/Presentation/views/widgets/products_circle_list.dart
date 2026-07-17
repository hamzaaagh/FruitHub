import 'package:flutter/material.dart';
import 'package:fruit_app/Core/entities/product_entity.dart';
import 'package:fruit_app/Core/functions/get_dummy_product.dart';
import 'package:fruit_app/Features/Sections/Presentation/views/widgets/circle_list_header.dart';
import 'package:fruit_app/Features/Sections/Presentation/views/widgets/circle_products_list_view.dart';

class ProductsCircleList extends StatelessWidget {
  const ProductsCircleList({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات تجريبية مطابقة للصورة
    final List<ProductEntity> products = getDummyProducts(9);

    return SliverToBoxAdapter(
      child: Directionality(
        textDirection:
            TextDirection.rtl, // لضبط الاتجاه من اليمين إلى اليسار العربي
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // السطر العلوي: العنوان وزر الترتيب
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: CircleListHeader(),
            ),

            // القائمة الأفقية للمنتجات
            CircleProductsListView(products: products),
          ],
        ),
      ),
    );
  }
}
