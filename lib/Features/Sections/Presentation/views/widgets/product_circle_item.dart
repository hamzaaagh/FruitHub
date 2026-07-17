import 'package:flutter/material.dart';
import 'package:fruit_app/Core/utils/app_styles.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ProductCircleItem extends StatelessWidget {
  final String name;
  final String imagePath;
  final VoidCallback onTap;

  const ProductCircleItem({
    super.key,
    required this.name,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // خلفية دائرية رمادية فاتحة تحتوي على صورة المنتج
            Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                color: Color(0xffF4F6F8), // لون الخلفية الفاتح كما في الصورة
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(12), // مسافة داخلية لحجم الصورة
              child: SvgPicture.asset(imagePath, fit: BoxFit.contain),
            ),
            const SizedBox(height: 8),
            // اسم المنتج
            Text(
              name,
              style: AppStyles.regular16.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
