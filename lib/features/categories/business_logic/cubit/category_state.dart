part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}
class CategoriesNameLoaded extends CategoryState {
 final List<dynamic>categoriesName;

  const CategoriesNameLoaded(this.categoriesName);
  
  @override
  List<Object> get props => [categoriesName];
}
class CategoryProductsLoaded extends CategoryState {
 final List<Product>categoryProducts;

const CategoryProductsLoaded(this.categoryProducts);
  @override
  List<Object> get props => [categoryProducts];
}
