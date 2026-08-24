import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Core/functions/build_image.dart';
import 'package:fruit_app/Core/functions/show_custom_confirm_dialog.dart';
import 'package:fruit_app/Features/Cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_app/Features/Cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruit_app/Features/Cart/presentation/manager/cart_item_action_cubit/cart_item_action_state.dart';
import 'package:fruit_app/Features/Cart/presentation/view/widgets/cart_quantity_control.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});
  final CartItemEntity cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // معاينة الصورة (مع دعم روابط الشبكة والـ Assets)
        Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            color: const Color(0xffF3F5F7),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(4),
          child: buildImage(cartItem.productEntity.imageUrl),
        ),
        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartItem.productEntity.name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${cartItem.calculateTotalWeight()} كم',
              style: const TextStyle(fontSize: 12, color: Color(0xffF4A723)),
            ),
            const SizedBox(height: 8),
            CartQuantityControl(
              quantity: cartItem.count,
              onIncrease: () => context.read<CartCubit>().increaseLocalItem(
                cartItem.productEntity.code,
              ),
              onDecrease: () => context.read<CartCubit>().decreaseLocalItem(
                cartItem.productEntity.code,
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(
                Icons.delete_outline,
                color: Color(0xffB1B1B1),
                size: 24,
              ),
              onPressed: () async {
                final result = await showCustomConfirmDialog(
                  context: context,
                  title: 'حذف المنتج',
                  content: 'هل أنت تأكد من إزالة هذا المنتج من سلة التسوق؟',
                  confirmText: 'حذف',
                  cancelText: 'إلغاء',
                );

                if (result == true && context.mounted) {
                  final uId = FirebaseAuth.instance.currentUser?.uid;
                  if (uId != null) {
                    final productCode = cartItem.productEntity.code;

                    // 1. تحديث الواجهة محلياً فوراً (Optimistic UI)
                    context.read<CartCubit>().removeLocalItem(productCode);

                    // 2. إرسال أمر الحذف للسيرفر
                    context.read<CartItemActionCubit>().deleteCartItem(
                      uId: uId,
                      productCode: productCode,
                    );
                  }
                }
              },
            ),
            const SizedBox(height: 16),
            Text(
              '${cartItem.calculateTotalPrice()} ليرة',
              style: const TextStyle(
                color: Color(0xffF4A723),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
