import 'package:e_commerce_app/features/products/data/models/product.dart';
import 'package:e_commerce_app/features/products/data/repositories/base_product_repository.dart';
import 'package:e_commerce_app/core/utils/dio_helper.dart';
class ProductRepository extends BaseProductRepository {
  final DioSrvice _dioSrvice;

  ProductRepository(this._dioSrvice);
  @override
  Future<List<Product>> getAllProducts() async {
    List<Product> products = [];
    var data =
    await _dioSrvice.getData(endPoint: 'products');
    for (var element in data) {
      products.add(Product.fromJson(element));
    }
    return products;
  }

}
