import 'package:dartz/dartz.dart';
import 'package:fruit_app/Core/Errors/failurs.dart';
import 'package:fruit_app/Core/entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failurs, List<ProductEntity>>> getProducts();
  Future<Either<Failurs, List<ProductEntity>>> getBestSellingProducts();
}