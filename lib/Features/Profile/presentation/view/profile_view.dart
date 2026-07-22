import 'package:flutter/material.dart';
import 'package:fruit_app/Features/Profile/presentation/view/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routeName = 'ProfileView';
  @override
  Widget build(BuildContext context) {
    return ProfileViewBody();
  }
}
