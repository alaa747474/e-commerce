part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}
class Productloaded extends ProductState {
  final List<Product>products;

 const Productloaded(this.products);
   @override
  List<Object> get props => [products];

}
