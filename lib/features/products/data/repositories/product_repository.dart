
import 'package:e_commerce_app/core/utils/dio_helper.dart';
import '../../products.dart';
class ProductRepository extends BaseProductRepository {
  final DioHelper _dioHelper;

  ProductRepository(this._dioHelper);
  @override
  Future<List<Product>> getAllProducts() async {
    List<Product> products = [];
    var data =
    await _dioHelper.getData(endPoint: 'products');
    for (var element in data) {
      products.add(Product.fromJson(element));
    }
    return products;
  }

}
