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
        color: const Color(0xFFF3F5F7),
        borderRadius: BorderRadius.circular(16), // انحناء الحواف الخارجية
      ),
      // 👈 تم تعديل الـ Stack ليبقى فقط لأيقونة القلب العائمة
      child: Stack(
        children: [
          // 1. محتوى الكارد الأساسي (مرتب عمودياً ومحمي بالكامل)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // جعل الصورة مرنة تأخذ المساحة المتاحة بالكامل دون دفع العناصر الأخرى للأسفل
                Expanded(
                  child: Center(
                    child: Skeleton.replace(
                      child: CachedNetworkImage(
                        imageUrl: product.imageUrl!,
                        fit: BoxFit.contain, // يضمن احتواء الصورة بالكامل
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8), // مسافة فاصلة بين الصورة والنصوص
                // اسم المنتج
                Text(
                  product.name,
                  maxLines: 1, // لمنع حدوث overflow إذا كان الاسم طويلاً جداً
                  overflow: TextOverflow
                      .ellipsis, // يضع ثلاث نقاط (...) إذا طال الاسم
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),

                const SizedBox(height: 4), // مسافة صغيرة جداً
                // 👈 الجديد هنا: الصف السفلي الذي يحتوي على السعر وزر الإضافة
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // يباعد بين السعر والزر
                  crossAxisAlignment:
                      CrossAxisAlignment.end, // يحاذيهم على السطر السفلي
                  children: [
                    // السعر
                    Flexible(
                      // يضمن عدم تداخل النص إذا كان السعر طويلاً جداً
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${product.price.toStringAsFixed(2)} ليرة ',
                              style: AppStyles.bold14.copyWith(
                                color: AppColors.accentColor,
                              ),
                            ),
                            TextSpan(
                              text: '/ الكيلو',
                              style: AppStyles.regular12.copyWith(
                                color: AppColors.accentColor,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),

                    // 👈 تم نقل زر الإضافة (علامة الزائد) إلى هنا داخل الـ Row
                    Container(
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
                  ],
                ),
              ],
            ),
          ),

          // 2. العناصر العائمة (بقي القلب فقط)

          // أيقونة القلب (المفضلة) - أعلى اليسار (تبقى عائمة لأنها لا تتداخل مع النصوص)
          Positioned(
            top: 8,
            right: 8,
            child: Icon(
              Icons.favorite_border,
              color: Colors.black.withOpacity(0.5),
              size: 20,
            ),
          ),

          // 👈 تم حذف الـ Positioned الخاص بزر الإضافة من هنا
        ],
      ),
    );
  }
}
