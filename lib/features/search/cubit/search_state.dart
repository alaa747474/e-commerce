part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}
class SearchLoaded extends SearchState {
  final List<Product>filteredList;
 const SearchLoaded(this.filteredList);
   @override
  List<Object> get props => [filteredList];
   
}
