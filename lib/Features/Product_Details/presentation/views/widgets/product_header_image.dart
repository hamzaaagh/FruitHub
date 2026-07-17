// --- 1. الـ Widget الخاصة بصورة المنتج والخلفية المقوسة ---
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductHeaderImage extends StatelessWidget {
  const ProductHeaderImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    const headerBorderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(160),
      bottomRight: Radius.circular(160),
    );

    return Stack(
      children: [
        // الخلفية المقوسة من الأسفل
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
            color: Color(0xFFF4F7F6),
            borderRadius: headerBorderRadius,
          ),
          // استخدام ClipRRect هنا يضمن بقاء شكل الانحناء المقوس حتى أثناء الـ Hero Animation
          child: ClipRRect(
            borderRadius: headerBorderRadius,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => Hero(
                tag: imageUrl,
                // هذا الباني يضمن بقاء شكل وتناسق الصورة ممتازاً أثناء الطيران عند الدخول والخروج
                flightShuttleBuilder:
                    (
                      flightContext,
                      animation,
                      flightDirection,
                      fromHeroContext,
                      toHeroContext,
                    ) {
                      return ClipRRect(
                        borderRadius: headerBorderRadius,
                        child: toHeroContext
                            .widget, // يعرض وجت الشاشة المستهدفة مباشرة أثناء الطيران
                      );
                    },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: Color(0xFF1B5E37)),
              ),
              errorWidget: (context, url, error) => Center(
                child: Hero(
                  tag:
                      imageUrl, // نضع التاغ هنا أيضاً لضمان عدم حدوث كراش إذا فشل تحميل الصورة
                  child: Icon(Icons.fastfood, size: 100, color: Colors.grey),
                ),
              ),
            ),
          ),
        ),

        // زر العودة العلوي
        Positioned(
          top: 50,
          right: 20,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.black87,
              ),
              onPressed: () => context.pop(),
            ),
          ),
        ),
      ],
    );
  }
}
