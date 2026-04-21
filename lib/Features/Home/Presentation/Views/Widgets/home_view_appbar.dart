import 'package:flutter/material.dart';
import 'package:fruit_app/Core/utils/app_assets.dart';
import 'package:fruit_app/Core/utils/app_colors.dart';
import 'package:fruit_app/Core/utils/app_styles.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "صباح الخير !..",
        style: AppStyles.regular16.copyWith(color: Color(0xFF949D9E)),
      ),
      subtitle: Text(
        "أحمد مصطفي",
        style: AppStyles.bold16.copyWith(color: Colors.black),
      ),
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(Assets.assetsImagesProfile1),
      ),
      trailing: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
          color: Color(0xffEEF8ED),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Icon(
            Icons.notifications_none_outlined,
            color: AppColors.secondarycolor,
          ),
        ),
      ),
    );
  }
}