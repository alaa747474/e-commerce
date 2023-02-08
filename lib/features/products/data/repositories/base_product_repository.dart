import 'package:e_commerce_app/features/products/data/models/product.dart';

abstract class BaseProductRepository {
  Future<List<Product>>getAllProducts();
}