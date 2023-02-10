import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../../products/products.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  List<Product> filtered = [];
  seatchFilter(
      {required String typedText, required List<Product> searchedList}) {
    filtered = searchedList
        .where((product) =>
            product.title!.startsWith(typedText) ||
            product.title!.toLowerCase().startsWith(typedText))
        .toList();
    emit(SearchLoaded(filtered));
  }
}
