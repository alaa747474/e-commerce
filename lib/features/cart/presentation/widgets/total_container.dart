import 'package:e_commerce_app/core/widgets/loading_indicator.dart';
import 'package:e_commerce_app/features/auth/auth.dart';
import 'package:e_commerce_app/features/cart/business_logic/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalContainer extends StatelessWidget {
  const TotalContainer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return state.cart.total==0?const SizedBox(): Container(
          height: 150,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Total : ${(state).cart.total.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                CustomButton(onPressed: (){}, text: 'Go to Chechout')
              ],
            ),
          ),
        );
        }
        return LoadingIndicator();
      },
    );
  }
}
