import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/cart/data/models/cart.dart';
import 'package:e_commerce_app/features/cart/data/repositories/cart_local_storage_repository.dart';
import 'package:e_commerce_app/features/products/data/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartLocalStorageRepository) : super(CartTetInitial());
  final CartLocalStorageRepository _cartLocalStorageRepository;
  
  loadCart()async{
    Box box=await _cartLocalStorageRepository.openBox();
    List<dynamic>productss=_cartLocalStorageRepository.getCartProducts(box);
    emit(CartLoaded(cart: Cart(products: productss as List<Product>)));
  }
 
  addtoCart(Product product)async{
    
   try {
     Box box=await _cartLocalStorageRepository.openBox();
      _cartLocalStorageRepository.addProductToCart(box, product);
     if (state is CartLoaded) {
     
      emit(CartLoaded(cart:Cart(products: List.from((state as CartLoaded).cart.products)..add(product))));
   }
   } catch (e) {
       debugPrint(e.toString()); 
   }
  }
  removeFromCart(Product product)async{

    try {
       Box box=await _cartLocalStorageRepository.openBox();
        _cartLocalStorageRepository.removeProductFromCart(box, product);
      if (state is CartLoaded) {
      emit(CartLoaded(cart: Cart(products: List.from((state as CartLoaded).cart.products)..remove(product))));
    }
    } catch (e) {
      debugPrint(e.toString()); 
    }
   }
}
