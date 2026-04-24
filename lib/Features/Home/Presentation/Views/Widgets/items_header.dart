import 'package:flutter/material.dart';
import 'package:fruit_app/Core/utils/app_styles.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/best_selling_view.dart';
import 'package:go_router/go_router.dart';

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
        GestureDetector(
          onTap: () => context.push('/${BestSellingView.routeName}'),
          child: Text(
            "عرض الكل",
            style: AppStyles.regular14.copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
