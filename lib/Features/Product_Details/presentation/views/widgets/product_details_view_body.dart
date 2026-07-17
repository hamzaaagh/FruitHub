import 'package:flutter/material.dart';
import 'package:fruit_app/Core/Widgets/custom_button.dart';
import 'package:fruit_app/Core/entities/product_entity.dart';
import 'package:fruit_app/Features/Product_Details/presentation/views/widgets/details_sliver_list.dart';
import 'package:fruit_app/Features/Product_Details/presentation/views/widgets/product_header_image.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // جعلنا الـ CustomScrollView تأخذ المساحة المتبقية كاملة عدا زر السلة السفلي ليظل ثابتاً في مكانه
        Expanded(
          child: CustomScrollView(
            slivers: [
              // 1. غطاء الصورة العلوي كـ Sliver لحركة تمرير سلسة
               SliverToBoxAdapter(child: ProductHeaderImage(imageUrl: product.imageUrl!)),

              // 2. محتوى تفاصيل المنتج داخل SliverPadding للمحافظة على المسافات الداخلية
               DetailsList(product: product),
              // 3. زر "أضف إلى السلة" في الأسفل
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    title: 'أضف الى السلة',
                    onPressed: () {
                      // تنفيذ أكشن الإضافة للسلة هنا
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
