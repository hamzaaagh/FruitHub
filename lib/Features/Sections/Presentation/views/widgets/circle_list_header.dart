import 'package:flutter/material.dart';

class CircleListHeader extends StatelessWidget {
  const CircleListHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'منتجاتنا',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        // زر الترتيب/الفلترة الموجود يسار الصورة
        IconButton(
          onPressed: () {
            // Action للترتيب
          },
          icon: const Icon(Icons.swap_vert, color: Colors.grey),
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Color(0xffEAEAEA)),
            ),
          ),
        ),
      ],
    );
  }
}