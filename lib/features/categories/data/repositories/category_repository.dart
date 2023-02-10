
import 'package:e_commerce_app/core/utils/dio_helper.dart';
import '../../../products/products.dart';
import '../../categories.dart';

class CategoryRepository extends BaseCategoryRepository {
  final DioHelper _dioHelper;

  CategoryRepository(this._dioHelper);
  @override
  Future<List<dynamic>> categoriesName() async {
    return await _dioHelper.getData(endPoint: 'products/categories');
  }

  @override
  Future<List<Product>> getCategories({required String categoryName}) async {
    var data =
        await _dioHelper.getData(endPoint: 'products/category/$categoryName');
    List<Product> categoryProducts = [];
    for (var element in data) {
      categoryProducts.add(Product.fromJson(element));
    }
    return categoryProducts;
  }
}
