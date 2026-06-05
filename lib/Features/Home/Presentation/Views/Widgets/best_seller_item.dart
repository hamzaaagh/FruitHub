import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/Core/entities/product_entity.dart';
import 'package:fruit_app/Core/utils/app_colors.dart';
import 'package:fruit_app/Core/utils/app_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    // استخدمت Container مع BoxDecoration لعمل الحواف المنحنية والخلفية الرمادية الفاتحة
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF3F5F7),
        borderRadius: BorderRadius.circular(16), // انحناء الحواف الخارجية
      ),
      child: Stack(
        children: [
          // 1. محتوى الكارد الأساسي (مرتب عمودياً)
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Skeleton.replace(
                      height: 150,
                      width: 150,
                      child: CachedNetworkImage(
                        imageUrl: product.imageUrl!,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  //   Spacer(),
                  const SizedBox(height: 12), // مسافة
                  // اسم المنتج (بطيخ)
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 4), // مسافة صغيرة

                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${product.price.toStringAsFixed(2)} ليرة ',
                          style: AppStyles.bold14.copyWith(
                            color: AppColors.accentColor,
                          ), // اللون الأخضر الغامق
                        ),
                        TextSpan(
                          text: '/ الكيلو',
                          style: AppStyles.regular12.copyWith(
                            color: AppColors.accentColor,
                          ), // اللون الرمادي
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ),

          // 2. العناصر العائمة (أيقونة القلب وزر الإضافة)

          // أيقونة القلب (المفضلة) - أعلى اليسار
          Positioned(
            top: 8,
            right: 8,
            child: Icon(
              Icons.favorite_border, // أيقونة قلب غير ممتلئ
              color: Colors.black.withOpacity(0.5), // لون رمادي شفاف قليلاً
              size: 20,
            ),
          ),

          // زر الإضافة (علامة الزائد) - أسفل اليمين
          Positioned(
            bottom: 12,
            left: 12,
            child: Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: AppColors.primarycolor, // اللون الأخضر الغامق
                shape: BoxShape.circle, // شكل دائري
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white, // لون علامة الزائد أبيض
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
