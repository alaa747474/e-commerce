

import 'package:e_commerce_app/core/utils/utils.dart';
import 'package:e_commerce_app/core/widgets/rating_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cart/cart.dart';
import '../../products.dart';


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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
             image: DecorationImage(
                 image: NetworkImage(product.image.toString()),
                 fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15),
            ),
            height: 130.h,
          ),
          Padding(
            padding:  EdgeInsets.all(5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: Theme.of(context).textTheme.headline3,
            ),
            RatingStars(product: product),
            Text(
            '${product.price}\$',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.red),
            ),
              ],
            ),
          ),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Padding(
                padding:  EdgeInsets.only(left: 5.w,right: 5.w,bottom: 5.h),
                child: AddToCartButton(
                  onPressed: () {
                    context.read<CartCubit>().addtoCart(product);
                    showCustomSnackBar(context: context, content: 'Added to Your Cart !!!');
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

