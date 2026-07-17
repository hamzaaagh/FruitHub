// --- 2. الـ Widget الخاصة بالاسم والسعر وأزرار التحكم بالكمية ---
import 'package:flutter/material.dart';

class ProductTitleAndPriceRow extends StatefulWidget {
  const ProductTitleAndPriceRow({
    super.key,
    required this.title,
    required this.price,
  });
  final String title;
  final num price;

  @override
  State<ProductTitleAndPriceRow> createState() => _ProductTitleAndPriceRowState();
}

class _ProductTitleAndPriceRowState extends State<ProductTitleAndPriceRow> {
  int quantity = 1;
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  '${widget.price} ليرة',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '/ الكيلو',
                  style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                ),
              ],
            ),
          ],
        ),
        // أزرار زيادة ونقصان الكمية
        Row(
          children: [
            _buildQuantityButton(
              onTap: () {
                quantity++;
                setState(() {}); // تحديث واجهة المستخدم بعد تغيير الكمية
              },
              Icons.add,
              const Color(0xFF1B5E37),
              Colors.white,
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '$quantity',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            _buildQuantityButton(
              onTap: () {
                if (quantity > 1) {
                  quantity--;
                  setState(() {}); // تحديث واجهة المستخدم بعد تغيير الكمية
                }
              },
              Icons.remove,
              const Color(0xFFF3F3F3),
              Colors.black54,
            ),
          ],
        ),
      ],
    );
  }
}

Widget _buildQuantityButton(IconData icon, Color bgColor, Color iconColor, {void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Icon(icon, color: iconColor, size: 20),
    ),
  );
}
