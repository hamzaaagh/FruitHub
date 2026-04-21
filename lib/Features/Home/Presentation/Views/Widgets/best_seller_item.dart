import 'package:flutter/material.dart';
import 'package:fruit_app/Core/utils/app_assets.dart';
import 'package:fruit_app/Core/utils/app_colors.dart';
import 'package:fruit_app/Core/utils/app_styles.dart';
import 'package:svg_flutter/svg_flutter.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

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
          Padding(
            padding: const EdgeInsets.all(12.0), // مسافة داخلية موحدة
            child: Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      //height: 150,
                      //alignment: Alignment.center,
                      Assets.assetsImagesPineapple,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Spacer(),
                  //const SizedBox(height: 12), // مسافة
                  // اسم المنتج (بطيخ)
                  const Text(
                    'بطيخ',
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
                          text: '20 جنية ',
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
