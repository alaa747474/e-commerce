import 'package:e_commerce_app/features/products/data/models/product.dart';

abstract class BaseCategoryRepository {
  Future<List<dynamic>>categoriesName();
  Future<List<Product>>getCategories({required String categoryName});
  //products/categories
}