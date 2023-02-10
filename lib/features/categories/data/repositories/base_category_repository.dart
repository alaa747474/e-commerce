import '../../../products/products.dart';
abstract class BaseCategoryRepository {
  Future<List<dynamic>>categoriesName();
  Future<List<Product>>getCategories({required String categoryName});
}