import 'package:dartz/dartz.dart';
import 'package:fruit_app/Core/Errors/failurs.dart';
import 'package:fruit_app/Features/Cart/domain/entities/cart_item_entity.dart';



abstract class CartRepo {
  Future<Either<Failurs, void>> addCartItem({
    required String uId,
    required CartItemEntity cartItemEntity,
  });

  Future<Either<Failurs, void>> deleteCartItem({
    required String uId,
    required String productCode,
  });
  Future<Either<Failurs, List<CartItemEntity>>> getCartItems({
    required String uId,
  });
}