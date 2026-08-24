import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Features/Cart/domain/cart_repo.dart';
import 'package:fruit_app/Features/Cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_app/Features/Cart/presentation/manager/cart_cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  List<CartItemEntity> cartItems = [];

  CartCubit({required this.cartRepo}) : super(CartInitial());

  // جلب كافة عناصر السلة من Firebase / API
  Future<void> getCartItems({required String uId}) async {
    emit(CartLoading());
    final result = await cartRepo.getCartItems(uId: uId);

    result.fold((failure) => emit(CartFailure(message: failure.message)), (
      items,
    ) {
      cartItems = items;
      emit(CartSuccess(cartItems: List.from(cartItems)));
    });
  }

  // إضافة منتج جديد أو زيادة كميته محلياً
  void addLocalItem(CartItemEntity newItem) {
    final index = cartItems.indexWhere(
      (item) => item.productEntity.code == newItem.productEntity.code,
    );
    if (index != -1) {
      cartItems[index].count += 1;
    } else {
      cartItems.add(newItem);
    }
    emit(CartSuccess(cartItems: List.from(cartItems)));
  }

  // زيادة كمية عنصر موجود محلياً
  void increaseLocalItem(String productCode) {
    final index = cartItems.indexWhere(
      (item) => item.productEntity.code == productCode,
    );
    if (index != -1) {
      cartItems[index].count += 1;
      emit(CartSuccess(cartItems: List.from(cartItems)));
    }
  }

  // إنقاص كمية عنصر محلياً (مع الحفاظ على أدنى حد = 1)
  void decreaseLocalItem(String productCode) {
    final index = cartItems.indexWhere(
      (item) => item.productEntity.code == productCode,
    );
    if (index != -1 && cartItems[index].count > 1) {
      cartItems[index].count -= 1;
      emit(CartSuccess(cartItems: List.from(cartItems)));
    }
  }

  // حذف عنصر محلياً
  void removeLocalItem(String productCode) {
    cartItems.removeWhere((item) => item.productEntity.code == productCode);
    emit(CartSuccess(cartItems: List.from(cartItems)));
  }

  // الحسابات
  num calculateTotalPrice() {
    return cartItems.fold(
      0,
      (total, item) => total + item.calculateTotalPrice(),
    );
  }

  int calculateTotalCount() {
    return cartItems.fold(0, (count, item) => count + item.count);
  }
}
