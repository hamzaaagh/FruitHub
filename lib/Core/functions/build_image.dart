 // دالة للتعامل مع روابط الـ Supabase أو الأصول المحلية
  import 'package:flutter/material.dart';

Widget buildImage(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return const Icon(Icons.fastfood, color: Colors.grey);
    }

    if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
      return Image.network(
        imageUrl,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.fastfood, color: Colors.grey),
      );
    }

    return Image.asset(
      imageUrl,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.fastfood, color: Colors.grey),
    );
  }