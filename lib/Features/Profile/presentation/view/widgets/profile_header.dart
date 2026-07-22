import 'package:flutter/material.dart';
import 'package:fruit_app/Core/functions/get_user.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String? imageUrl;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Avatar with Camera Icon
        Stack(
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: imageUrl != null
                  ? NetworkImage(imageUrl!)
                  : null,
              child: imageUrl == null
                  ? const Icon(Icons.person, size: 40, color: Colors.grey)
                  : null,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 14,
                  color: Colors.green.shade700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        // Name and Email
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getUser().name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B2E35),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              getUser().email,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
            ),
          ],
        ),
      ],
    );
  }
}
