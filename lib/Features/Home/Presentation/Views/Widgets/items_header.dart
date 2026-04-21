import 'package:flutter/material.dart';
import 'package:fruit_app/Core/utils/app_styles.dart';

class ItemsHeader extends StatelessWidget {
  const ItemsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "الأكثر مبيعًا",
          style: AppStyles.bold16.copyWith(color: Colors.black),
        ),
        Text(
          "عرض الكل",
          style: AppStyles.regular14.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}