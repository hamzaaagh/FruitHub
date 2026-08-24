import 'package:fruit_app/Features/Cart/domain/entities/cart_item_entity.dart';

abstract class CartItemActionState {}

class CartItemActionInitial extends CartItemActionState {}

class CartItemActionLoading extends CartItemActionState {}

class CartItemAddedSuccess extends CartItemActionState {
  final CartItemEntity cartItem;
  CartItemAddedSuccess({required this.cartItem});
}

class CartItemDeletedSuccess extends CartItemActionState {
  final String productCode;
  CartItemDeletedSuccess({required this.productCode});
}

class CartItemActionFailure extends CartItemActionState {
  final String message;
  CartItemActionFailure({required this.message});
}