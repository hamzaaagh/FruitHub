import 'package:flutter/material.dart';
import 'package:fruit_app/Core/Widgets/notifacation_widget.dart';
import 'package:fruit_app/Core/functions/get_user.dart' show getUser;
import 'package:fruit_app/Core/utils/app_assets.dart';
import 'package:fruit_app/Core/utils/app_styles.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "صباح الخير !..",
        style: AppStyles.regular16.copyWith(color: Color(0xFF949D9E)),
      ),
      subtitle: Text(
        getUser().name,
        style: AppStyles.bold16.copyWith(color: Colors.black),
      ),
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(Assets.assetsImagesProfile1),
      ),
      trailing: NotifacationWidget(),
    );
  }
}
