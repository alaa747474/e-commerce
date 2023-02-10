
import 'package:e_commerce_app/core/widgets/empty_data_widget.dart';
import 'package:e_commerce_app/core/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const String routeName ='/cart_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Cart',style: Theme.of(context).textTheme.headline3,),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back,color: Colors.black,)),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {

          if (state is CartLoaded) {
            Map cartPorducts=state.cart.productQuantity(state.cart.products);
            return cartPorducts.isEmpty? const Center(child: EmptyDataWidget(text: 'Your Cart is Empty',)): ListView.builder(
              itemCount: cartPorducts.keys.length,
              itemBuilder: (BuildContext context, int index) {
                return CartProductCard(product: cartPorducts.keys.elementAt(index),quantity: cartPorducts.values.elementAt(index),);
              },
            );
          }
          return const CustomErrorwidget();
        },
      ),
      bottomSheet:  const TotalContainer(),
    );
  }
}