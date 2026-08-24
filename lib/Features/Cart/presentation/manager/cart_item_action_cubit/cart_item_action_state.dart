import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Core/entities/product_entity.dart';
import 'package:fruit_app/Features/Cart/domain/cart_repo.dart';
import 'package:fruit_app/Features/Cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_app/Features/Cart/presentation/manager/cart_item_action_cubit/cart_item_action_cubit.dart';

class CartItemActionCubit extends Cubit<CartItemActionState> {
  final CartRepo cartRepo;

  CartItemActionCubit({required this.cartRepo}) : super(CartItemActionInitial());

  // إضافة منتج للسلة
  Future<void> addCartItem({
    required String uId,
    required ProductEntity productEntity,
  }) async {
    emit(CartItemActionLoading());

    final cartItemEntity = CartItemEntity(
      productEntity: productEntity,
      count: 1,
    );

    final result = await cartRepo.addCartItem(
      uId: uId,
      cartItemEntity: cartItemEntity,
    );

    result.fold(
      (failure) => emit(CartItemActionFailure(message: failure.message)),
      (_) => emit(CartItemAddedSuccess(cartItem: cartItemEntity)),
    );
  }

  // حذف منتج من السلة
  Future<void> deleteCartItem({
    required String uId,
    required String productCode,
  }) async {
    emit(CartItemActionLoading());

    final result = await cartRepo.deleteCartItem(
      uId: uId,
      productCode: productCode,
    );

    result.fold(
      (failure) => emit(CartItemActionFailure(message: failure.message)),
      (_) => emit(CartItemDeletedSuccess(productCode: productCode)),
    );
  }
}