import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Core/Widgets/custom_button.dart';
import 'package:fruit_app/Core/entities/product_entity.dart';
import 'package:fruit_app/Features/Cart/presentation/manager/cart_item_action_cubit/cart_item_action_cubit.dart';
import 'package:fruit_app/Features/Cart/presentation/manager/cart_item_action_cubit/cart_item_action_state.dart';
import 'package:fruit_app/Features/Product_Details/presentation/views/widgets/details_sliver_list.dart';
import 'package:fruit_app/Features/Product_Details/presentation/views/widgets/product_header_image.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              // 1. غطاء الصورة العلوي
              SliverToBoxAdapter(
                child: ProductHeaderImage(imageUrl: product.imageUrl!),
              ),

              // 2. محتوى تفاصيل المنتج
              DetailsList(product: product),

              // 3. زر "أضف إلى السلة" مع متابعة الحالات
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BlocConsumer<CartItemActionCubit, CartItemActionState>(
                    listener: (context, state) {
                      if (state is CartItemAddedSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('تمت إضافة المنتج إلى السلة بنجاح'),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else if (state is CartItemActionFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                        title: 'أضف الى السلة',
                        onPressed: () {
                          final uId = FirebaseAuth.instance.currentUser!.uid;

                          context.read<CartItemActionCubit>().addCartItem(
                            uId: uId,
                            productEntity: product,
                          );
                          context.pop();
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
