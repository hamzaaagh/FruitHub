import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Core/Widgets/custom_appbar.dart';
import 'package:fruit_app/Core/Widgets/custom_button.dart';
import 'package:fruit_app/Core/functions/build_snackbar.dart';
import 'package:fruit_app/Core/functions/get_dummy_product.dart';
import 'package:fruit_app/Features/Cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruit_app/Features/Cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:fruit_app/Features/Cart/presentation/manager/cart_item_action_cubit/cart_item_action_cubit.dart';
import 'package:fruit_app/Features/Cart/presentation/manager/cart_item_action_cubit/cart_item_action_state.dart';
import 'package:fruit_app/Features/Cart/presentation/view/widgets/cart_header.dart';
import 'package:fruit_app/Features/Cart/presentation/view/widgets/cart_items_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  void initState() {
    super.initState();
    final uId = FirebaseAuth.instance.currentUser?.uid;
    if (uId != null) {
      context.read<CartCubit>().getCartItems(uId: uId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartItemActionCubit, CartItemActionState>(
      listener: (context, state) {
        if (state is CartItemAddedSuccess) {
          context.read<CartCubit>().addLocalItem(state.cartItem);
          buildSnackBar(context, 'تمت إضافة المنتج إلى السلة بنجاح',);
        } else if (state is CartItemDeletedSuccess) {
          buildSnackBar(context, 'تم حذف المنتج من السلة بنجاح',);
        } else if (state is CartItemActionFailure) {
          buildSnackBar(context, state.message,);
          // في حال فشل الحذف في السيرفر، نعيد جلب العناصر لضمان مزامنة الواجهة
          final uId = FirebaseAuth.instance.currentUser?.uid;
          if (uId != null) {
            context.read<CartCubit>().getCartItems(uId: uId);
          }
        }
      },
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cartCubit = context.read<CartCubit>();
          final isLoading = state is CartLoading && cartCubit.cartItems.isEmpty;

          if (state is CartFailure && cartCubit.cartItems.isEmpty) {
            return Center(child: Text(state.message));
          }

          final displayItems = isLoading
              ? getDummyCartItems(4)
              : cartCubit.cartItems;

          final totalPrice = isLoading ? 0 : cartCubit.calculateTotalPrice();
          final totalCount = isLoading ? 4 : cartCubit.cartItems.length;

          return Skeletonizer(
            enabled: isLoading,
            child: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      const SliverToBoxAdapter(
                        child: CustomAppBar(
                          title: 'السلة',
                          showBackButton: false,
                        ),
                      ),
                      SliverToBoxAdapter(child: CartHeader(count: totalCount)),
                      CartItemList(cartItems: displayItems),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Visibility(
                    visible: cartCubit.cartItems.isNotEmpty,
                    child: CustomButton(
                      title: 'الدفع $totalPrice ليرة',
                      onPressed: (cartCubit.cartItems.isEmpty || isLoading)
                          ? null
                          : () {
                              // الانتقال لصفحة Checkout
                            },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}