
import 'package:e_commerce_app/core/widgets/rating_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../products/products.dart';
import '../../cart.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({super.key, required this.product, required this.quantity});
  final Product product;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final title=product.title!.split(' ').take(2).join(' ').split('-').join(' ');
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(product.image.toString()),
                        fit: BoxFit.cover)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: Theme.of(context).textTheme.headline3),
                  RatingStars(product: product),
                  Text('${product.price}\$',style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.red),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIcon(icon: Icon(Icons.add,color: Theme.of(context).backgroundColor,), onPressed: () {
                    context.read<CartCubit>().addtoCart(product);
                  }),
                  Text(quantity.toString(),style: Theme.of(context).textTheme.headline3),
                  CustomIcon(icon: Icon(Icons.remove,color: Theme.of(context).backgroundColor,), onPressed: () {
                    context.read<CartCubit>().removeFromCart(product);
                  }),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}


