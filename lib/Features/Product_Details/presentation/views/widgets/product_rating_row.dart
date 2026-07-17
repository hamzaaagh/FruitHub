// --- 3. الـ Widget الخاصة بالتقييم والمراجعات ---
import 'package:flutter/material.dart';
import 'package:fruit_app/Core/utils/app_styles.dart';

class ProductRatingRow extends StatelessWidget {
  const ProductRatingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 20),
        const SizedBox(width: 4),
         Text(
          '4.8',
          style: AppStyles.bold14.copyWith(color: Colors.black87),
        ),
        const SizedBox(width: 4),
        Text('(30+)', style: AppStyles.regular14.copyWith(color: Colors.grey[400])),
        const SizedBox(width: 16),
         Text(
          'المراجعه',
          style: AppStyles.regular14.copyWith(color: Colors.green[700]),
        ),
      ],
    );
  }
}