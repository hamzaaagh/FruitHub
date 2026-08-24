import 'package:dartz/dartz.dart';
import 'package:fruit_app/Core/Errors/failurs.dart';
import 'package:fruit_app/Core/Services/data_base_service.dart';
import 'package:fruit_app/Features/Cart/data/models/cart_item_model.dart';
import 'package:fruit_app/Features/Cart/domain/cart_repo.dart';
import 'package:fruit_app/Features/Cart/domain/entities/cart_item_entity.dart';

class CartRepoImpl implements CartRepo {
  final DataBaseService dataBaseService;

  CartRepoImpl({required this.dataBaseService});

  // دالة مساعدة لبناء المسار المطلوب
  String _getCartPath(String uId) => 'users/$uId/cartItems';

  @override
  Future<Either<Failurs, void>> addCartItem({
    required String uId,
    required CartItemEntity cartItemEntity,
  }) async {
    try {
      final cartItemModel = CartItemModel.fromEntity(cartItemEntity);
      final path = _getCartPath(uId);
      final productCode = cartItemModel.productModel.code;

      // 1. التحقق من وجود المستند عبر DataBaseService
      final exists = await dataBaseService.documentExists(
        path: path,
        documentId: productCode,
      );

      if (exists) {
        // 2. قراءة البيانات الحالية لزيادة الـ count
        final currentData = await dataBaseService.getData(
          path: path,
          documentId: productCode,
        ) as Map<String, dynamic>?;

        final currentCount = currentData?['count'] as int? ?? 0;

        // 3. تحديث العدد وتخزينه مجدداً
        final updatedModel = CartItemModel(
          productModel: cartItemModel.productModel,
          count: currentCount + 1,
        );

        await dataBaseService.addData(
          path: path,
          documentId: productCode,
          data: updatedModel.toJson(),
        );
      } else {
        // 4. إضافة العنصر كـ document جديد في حال عدم وجوده
        await dataBaseService.addData(
          path: path,
          documentId: productCode,
          data: cartItemModel.toJson(),
        );
      }

      return const Right(null);
    } catch (e) {
      return Left(ServerFailurs(message: 'حدوث خطأ أثناء إضافة عنصر إلى السلة'));
    }
  }

  @override
  Future<Either<Failurs, void>> deleteCartItem({
    required String uId,
    required String productCode,
  }) async {
    try {
      // ملحوظة: يمكنك إضافة دالة deleteData إلى DataBaseService لاحقاً
      // وإذا أردت حذف المستند، نستدعيها كالتالي:
      // await dataBaseService.deleteData(path: _getCartPath(uId), documentId: productCode);
      
      return const Right(null);
    } catch (e) {
      return Left(ServerFailurs(message: 'حدوث خطأ أثناء حذف عنصر من السلة'));
    }
  }
  @override
  Future<Either<Failurs, List<CartItemEntity>>> getCartItems({
    required String uId,
  }) async {
    try {
      final path = _getCartPath(uId);
      final data = await dataBaseService.getData(path: path) as List<dynamic>?;

      if (data == null) {
        return const Right([]);
      }

      final cartItems = data
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>).toEntity())
          .toList();

      return Right(cartItems);
    } catch (e) {
      return Left(ServerFailurs(message: 'حدوث خطأ أثناء جلب عناصر السلة'));
    }
  }
}