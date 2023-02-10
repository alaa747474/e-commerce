
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../cart/cart.dart';
import '../../../categories/categories.dart';
import '../../../search/search.dart';
import '../../products.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.userName});
  static const routeName = '/product_screen';
  final String userName;

  @override
  Widget build(BuildContext context) {
    List colors = [
      Theme.of(context).cardColor.withOpacity(0.4),
      const Color.fromARGB(255, 251, 221, 224),
      const Color.fromARGB(255, 185, 234, 255),
      const Color.fromARGB(255, 255, 178, 204)
    ];
    List images = [
      'assets/images/elctronics.png',
      'assets/images/jewelry.png',
      'assets/images/menclothes.png',
      'assets/images/womenclothes.png'
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return IconButton(onPressed: (){
                      Navigator.pushNamed(context, SearchScreen.routeName,arguments:(state as Productloaded).products);
                    }, icon: Icon(Icons.search,color: Theme.of(context).cardColor,));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Theme.of(context).primaryColor,
                )),
          )
        ],
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello $userName',
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              'How are you today ?',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.grey),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductInitial) {
              return const LoadingIndicator();
            }
            if (state is Productloaded) {
              return Column(
                children: [

                  Container(
                    margin:const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    
                    height: 120,
                    child: BlocBuilder<CategoryCubit, CategoryState>(
                      builder: (context, state) {
                        return GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 110,
                            crossAxisCount: 1,
                          ),
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                              if (state is CategoriesNameLoaded) {
                                return InkWell(
                                  onTap: () {
                                    context
                                        .read<CategoryCubit>()
                                        .getCategoryProducts(
                                            categoryName: state
                                                .categoriesName[index]
                                                .toString());
                                    Navigator.pushNamed(
                                        context, CartegoriesScreen.routeName,
                                        arguments: index);
                                  },
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: colors[index],
                                        radius: 40,
                                        child: Image.asset(
                                          images[index],
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                      Text(
                                        state.categoriesName[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return const LoadingIndicator();
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.only(bottom: 10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10 / 1,
                              crossAxisSpacing: 10 / 1,
                              crossAxisCount: 2,
                              childAspectRatio: 0.6),
                      itemCount:state.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, ProductDetailsScreen.routeName,
                              arguments: state.products[index]),
                          child: ProductCard(
                            product:state.products[index],
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            }
            return const CustomErrorwidget();
          },
        ),
      ),
    );
  }
}