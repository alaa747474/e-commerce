import 'package:e_commerce_app/features/products/data/models/product.dart';
import 'package:hive/hive.dart';
abstract class BaseCartLocalStorageRepository{
  Future<Box>openBox();
  List<Product>getCartProducts(Box box);
  Future<void>addProductToCart(Box box,Product product);
  Future<void>removeProductFromCart(Box box,Product product);
}