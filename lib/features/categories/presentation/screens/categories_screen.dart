
import 'package:e_commerce_app/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../products/products.dart';
import '../../categories.dart';

class CartegoriesScreen extends StatelessWidget {
  const CartegoriesScreen({super.key, required this.categoryIndex});
  final int categoryIndex;
  static const String routeName = '/categories_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryProductsLoaded) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).backgroundColor,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  context.read<CategoryCubit>().getCategoriesName();
                  Navigator.pop(context);
                },
              ),
              title: Text(
                state.categoryProducts[categoryIndex].category.toString(),
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            body: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10 / 1,
                  crossAxisSpacing: 10 / 1,
                  childAspectRatio: 0.6),
              itemCount: state.categoryProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: ()=>Navigator.pushNamed(context, ProductDetailsScreen.routeName,arguments:state.categoryProducts[index] ),
                  child: ProductCard(
                      product: state.categoryProducts[index],),
                );
              },
            ),
          );
        }
        return const Scaffold(
          body: LoadingIndicator(),
        );
      },
    );
  }
}
