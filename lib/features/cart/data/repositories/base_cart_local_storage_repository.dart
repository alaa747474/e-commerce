
import 'package:hive/hive.dart';

import '../../../products/products.dart';
abstract class BaseCartLocalStorageRepository{
  Future<Box>openBox();
  List<Product>getCartProducts(Box box);
  Future<void>addProductToCart(Box box,Product product);
  Future<void>removeProductFromCart(Box box,Product product);
}