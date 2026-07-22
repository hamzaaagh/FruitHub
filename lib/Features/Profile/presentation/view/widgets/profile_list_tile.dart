import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const ProfileListTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: onTap,
          leading: Icon(
            leadingIcon,
            color: Colors.green.shade700,
            size: 22,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          trailing: trailing ??
              const Icon(
                Icons.arrow_back_ios_new,
                size: 16,
                color: Colors.black54,
              ),
        ),
        const Divider(height: 1, thickness: 0.5, color: Color(0xFFEEEEEE)),
      ],
    );
  }
}