
import 'package:e_commerce_app/features/cart/business_logic/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/products/data/models/product.dart';
import 'package:e_commerce_app/features/products/presentaion/widgets/add_to_cart_button.dart';
import 'package:e_commerce_app/core/utils/utils.dart';
import 'package:e_commerce_app/core/widgets/rating_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final title=product.title!.split(' ').take(2).join(' ').split('-').join(' ');
    return Container(
      
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(product.image.toString()),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.infinity,
            height: 180,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline3,
                ),
                RatingStars(product: product),
                Text(
                  '${product.price}\$',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.red),
                ),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return AddToCartButton(
                      onPressed: () {
                        context.read<CartCubit>().addtoCart(product);
                        showCustomSnackBar(context: context, content: 'Added to Your Cart !!!');
                      },
                    );
                  },
                )
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       '$price\$',
                //       style: Theme.of(context)
                //           .textTheme
                //           .headline4!
                //           .copyWith(color: Colors.red),
                //     ),
                //     InkWell(
                //       onTap: (){
                //         showCustomSnackBar(context: context, content: 'Test');
                //       },
                //       child: CircleAvatar(
                //           radius: 15,
                //           backgroundColor: Theme.of(context).primaryColor,
                //           child: Icon(
                //             Icons.shopping_cart,
                //             color: Theme.of(context).backgroundColor,
                //             size: 20,
                //           )),
                //     ),
                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
