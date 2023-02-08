import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/products/data/models/product.dart';
import 'package:e_commerce_app/features/products/data/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepository) : super(ProductInitial());
  final ProductRepository _productRepository;

  getAllProducts() {
    emit(ProductInitial());
    try {
      _productRepository.getAllProducts().then((products) {
        emit(Productloaded(products));
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
