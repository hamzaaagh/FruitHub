import 'package:flutter/material.dart';
import 'package:fruit_app/Core/utils/app_colors.dart';
import 'package:fruit_app/Core/utils/app_styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        //textAlign: TextAlign.right, // للكتابة بالعربية
        decoration: InputDecoration(
          hintText: "ابحث عن....... ",
          hintStyle: AppStyles.regular14.copyWith(color: Colors.grey),
          suffixIcon: const Icon(
            Icons.tune,
            color: Colors.grey,
          ), // أيقونة الفلتر
          prefixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: AppColors.secondarycolor),
          ), // أيقونة البحث
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
