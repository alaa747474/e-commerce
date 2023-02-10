
import 'package:e_commerce_app/core/widgets/rating_builder.dart';
import 'package:flutter/material.dart';

import '../../products.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  static const String routeName = '/product_details_screen';
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          product.category.toString(),
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(product.image.toString()),
                      fit: BoxFit.fitHeight)),
            ),
            Text(
              product.title.toString(),
              style: Theme.of(context).textTheme.headline2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total (${product.rating!.count})',
                  style: Theme.of(context).textTheme.headline4,
                ),
                RatingStars(product: product)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Product Details',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              product.description.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomSheet: BottomContainer(product: product),
    );
  }
}
