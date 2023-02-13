
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
     final mqHieght=MediaQuery.of(context).size.height;
    final mqWidth=MediaQuery.of(context).size.width;
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
        padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductInitial) {
              return const LoadingIndicator();
            }
            if (state is Productloaded) {
              return Column(
                children: [

                  Container(
                    margin: EdgeInsets.only(bottom: 8.h),
                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    
                    height: mqHieght/7,
                    child: BlocBuilder<CategoryCubit, CategoryState>(
                      builder: (context, state) {
                        return GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                               SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: mqWidth/3.8,
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
                                  child: CategoryWidget(color: colors[index],images: images[index],text: state.categoriesName[index],)
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
                      padding:  EdgeInsets.only(bottom: 10.h),
                      gridDelegate:
                           SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10 / 1.r,
                              crossAxisSpacing: 10 / 1.r,
                              crossAxisCount: 2,
                              childAspectRatio: 0.55.r),
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

