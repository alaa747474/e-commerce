import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/categories/data/repositories/category_repository.dart';
import 'package:e_commerce_app/features/products/data/models/product.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._categoryRepository) : super(CategoryInitial());
  final CategoryRepository _categoryRepository;
  getCategoriesName(){
    _categoryRepository.categoriesName().then((value) {
      emit(CategoriesNameLoaded(value));
    });
  }
  getCategoryProducts({required String categoryName}){
    _categoryRepository.getCategories(categoryName: categoryName).then((value) {
      emit(CategoryProductsLoaded(value));
    });
  }
}
