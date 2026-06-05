import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/Core/entities/product_entity.dart';
import 'package:fruit_app/Core/repos/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());
  final ProductRepo productRepo;
  Future<void> getProducts() async {
    emit(ProductLoading());
    var result = await productRepo.getProducts();
    result.fold((failure) => emit(ProductFailure(failure.message)), (products) {
      emit(ProductSuccess(products));
      print ("Products fetched successfully: ${products[0].imageUrl}");
    });
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductLoading());
    var result = await productRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProductFailure(failure.message)),
      (products) => emit(ProductSuccess(products)),
    );
  }
}
