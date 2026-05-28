import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_app/Core/Errors/failurs.dart';
import 'package:fruit_app/Core/Models/product_model.dart';
import 'package:fruit_app/Core/Services/data_base_service.dart';
import 'package:fruit_app/Core/entities/product_entity.dart';
import 'package:fruit_app/Core/repos/product_repo.dart';
import 'package:fruit_app/Core/utils/backend_endpoints.dart';

class ProductRepoImpl implements ProductRepo {
  final DataBaseService dataBaseService;

  ProductRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failurs, List<ProductEntity>>> getProducts() async {
    try {
      var data = await dataBaseService.getData(
        path: BackendEndpoints.getProducts,
      );
      List<ProductEntity> products = data.map<ProductEntity>((json) {
        return ProductModel.fromJson(json as Map<String, dynamic>);
      }).toList();
      return Right(products);
    } on Exception catch (e) {
      log("Error fetching products: ${e.toString()}");
      return Left(
        ServerFailurs(message: "Failed to fetch products: ${e.toString()}"),
      );
    }
  }

  @override
  Future<Either<Failurs, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await dataBaseService.getData(
        path: BackendEndpoints.getProducts,
        query: {"orderBy": "sellingCount", "descending": true, "limit": 10},
      );
      List<ProductEntity> products = data.map<ProductEntity>((json) {
        return ProductModel.fromJson(json as Map<String, dynamic>);
      }).toList();
      return Right(products);
    } on Exception catch (e) {
      log("Error fetching products: ${e.toString()}");
      return Left(
        ServerFailurs(message: "Failed to fetch products: ${e.toString()}"),
      );
    }
  }
}
