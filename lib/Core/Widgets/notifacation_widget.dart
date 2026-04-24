import 'package:flutter/material.dart';
import 'package:fruit_app/Core/utils/app_colors.dart';

class NotifacationWidget extends StatelessWidget {
  const NotifacationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}