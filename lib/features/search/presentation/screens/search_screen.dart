import 'package:e_commerce_app/core/widgets/empty_data_widget.dart';
import 'package:e_commerce_app/features/auth/auth.dart';
import 'package:e_commerce_app/features/products/data/models/product.dart';
import 'package:e_commerce_app/features/products/presentaion/widgets/product_card.dart';
import 'package:e_commerce_app/features/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.products});
  final List<Product> products;
  static const String routeName = '/search_screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
        child: Column(
          children: [
            CustomTextFormField(
                onChanged: (productName) {
                  context.read<SearchCubit>().seatchFilter(
                      typedText: productName, searchedList: widget.products);
                },
                color: Colors.white,
                obscureText: false,
                hintText: 'Search',
                icon: Icons.search,
                controller: searchController,
                validator: null),
            Expanded(child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoaded) {
                  return searchController.value.text == ''     
                      ? const EmptyDataWidget(text: 'Start Search'):
                       state.filteredList.isEmpty?
                       const EmptyDataWidget(text: 'No search Found')
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 10 / 1,
                                  crossAxisSpacing: 10 / 1,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.6),
                          itemCount: searchController.value.text == ''
                              ? 0
                              : state.filteredList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard(
                                product: state.filteredList[index]);
                          },
                        );
                }
                return const EmptyDataWidget(text: 'start Search');
              },
            ))
          ],
        ),
      ),
    );
  }
}
