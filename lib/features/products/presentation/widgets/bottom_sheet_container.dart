
import 'package:e_commerce_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cart/cart.dart';
import '../../products.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
              spreadRadius: 6,
              blurRadius: 10,
              color: Colors.grey[400]!.withOpacity(0.3),
              offset: const Offset(0, -10))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${product.price} \$',
              style: Theme.of(context).textTheme.headline2,
            ),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return AddToCartButton(
                  width: 150,
                  onPressed: () {
                    context.read<CartCubit>().addtoCart(product);
                    showCustomSnackBar(context: context, content:'Added to your Cart');
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
