import 'package:e_commerce_app/features/products/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({super.key,required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
                    allowHalfRating: true,
                    direction: Axis.horizontal,
                    initialRating: product.rating!.rate.toDouble(),
                    itemSize: 20,
                    itemBuilder: (context, index) {
                      return const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      );
                    },
                    onRatingUpdate: ((value) {}));
  }
}