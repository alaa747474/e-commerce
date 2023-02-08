import 'package:e_commerce_app/features/products/data/models/product.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable{
  final List<Product>products;
  
  const Cart({this.products=const <Product>[]});
  @override
  List<Object?> get props =>[products];
  Map productQuantity(product){
    Map quantity ={};

    for (var product in products) {
      if (!quantity.containsKey(product)) {
      quantity[product]=1;
    }else {
      quantity[product]+=1;
    }
    }
    return quantity;
  }
  double get total => products.fold(0, (total,current) => total+current.price.toDouble());
}