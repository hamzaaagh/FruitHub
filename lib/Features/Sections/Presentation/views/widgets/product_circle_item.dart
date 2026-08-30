import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductCircleItem extends StatelessWidget {
  const ProductCircleItem({
    super.key,
    required this.name,
    required this.imagePath,
    this.onTap,
  });

  final String name;
  final String imagePath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                color: Color(0xFFF3F5F7),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                // 1. تقليل أو حذف الـ Padding لتكبير المساحة للـ SVG
                child: Padding(
                  padding: const EdgeInsets.all(4.0), // غيرناها من 12 إلى 4
                  child: _buildImageWidget(imagePath),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0C0D0E),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWidget(String path) {
    if (path.isEmpty) {
      return const Icon(Icons.image_not_supported, color: Colors.grey);
    }

    final cleanPath = path.trim();

    // التعامل مع ملفات SVG المحلية
    if (cleanPath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        cleanPath,
        // 2. تجربة BoxFit.cover أو BoxFit.contain 
        fit: BoxFit.contain,
        alignment: Alignment.center,
      );
    }

    return Image.asset(
      cleanPath,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.broken_image, color: Colors.red),
    );
  }
}