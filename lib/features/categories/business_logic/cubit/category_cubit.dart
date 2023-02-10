import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../products/products.dart';
import '../../categories.dart';

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
