import 'package:flutter/material.dart';
import 'package:fruit_app/Core/utils/app_assets.dart';
import 'package:fruit_app/Core/utils/app_colors.dart';
import 'package:fruit_app/Core/utils/app_styles.dart';
import 'package:svg_flutter/svg_flutter.dart';

class OfferBannerItem extends StatelessWidget {
  const OfferBannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AspectRatio(
      aspectRatio: 342 / 158,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            // --- الجزء الأخضر المنحني (الخلفية) ---
            Positioned.fill(
              child: Image.asset(
                //سيكون متحول حسب العرض
                Assets.assetsImagesFruit1,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              width: 230, // عرض الصورة
              child: SvgPicture.asset(Assets.assetsImagesVector3),
            ),
            Positioned(
              right: 20, // مسافة من الحافة اليمنى
              top: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                width: width * 0.45, // مساحة النص
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // محاذاة لليمين
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // توزيع متساوي
                  children: [
                    Text(
                      'عروض العيد',
                      textAlign: TextAlign.right,
                      style: AppStyles.regular14.copyWith(color: Colors.white),
                    ),
                    Text(
                      'خصم 25%',
                      textAlign: TextAlign.right,
                      style: AppStyles.bold24.copyWith(color: Colors.white),
                    ),
                    // الزر
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'تسوق الآن',
                        style: AppStyles.bold18.copyWith(
                          color: AppColors.primarycolor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
