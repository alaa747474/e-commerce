import 'package:e_commerce_app/features/categories/data/repositories/base_category_repository.dart';
import 'package:e_commerce_app/features/products/data/models/product.dart';
import 'package:e_commerce_app/core/utils/dio_helper.dart';

class CategoryRepository extends BaseCategoryRepository {
  final DioSrvice _dioSrvice;

  CategoryRepository(this._dioSrvice);
  @override
  Future<List<dynamic>> categoriesName() async {
    return await _dioSrvice.getData(endPoint: 'products/categories');
  }

  @override
  Future<List<Product>> getCategories({required String categoryName}) async {
    var data =
        await _dioSrvice.getData(endPoint: 'products/category/$categoryName');
    List<Product> categoryProducts = [];
    for (var element in data) {
      categoryProducts.add(Product.fromJson(element));
    }
    return categoryProducts;
  }
}
