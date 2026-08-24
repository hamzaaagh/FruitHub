import 'package:fruit_app/Features/Cart/domain/entities/cart_item_entity.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final List<CartItemEntity> cartItems;
  CartSuccess({required this.cartItems});
}

class CartFailure extends CartState {
  final String message;
  CartFailure({required this.message});
}