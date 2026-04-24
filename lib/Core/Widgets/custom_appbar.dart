import 'package:flutter/material.dart';
import 'package:fruit_app/Core/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.suffixIcon,
    this.showBackButton = true,
  });
  final String title;
  final Widget? suffixIcon;
  final bool showBackButton;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(title, style: AppStyles.bold20),
      centerTitle: true,
      leading: showBackButton
          ? IconButton(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back_ios, size: 24),
                ),
              ),
            )
          : null,
      actions: [
        TextButton(
          onPressed: () {
            // Logic هنا
          },
          child:
              suffixIcon ??
              const SizedBox(), // إذا لم يتم توفير suffixIcon، سيتم عرض SizedBox فارغ
        ),
      ],
    );
  }
}
