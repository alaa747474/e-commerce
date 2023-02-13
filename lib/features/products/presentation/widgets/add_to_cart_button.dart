
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    required this.onPressed,
     this.width=double.infinity,
    Key? key,
  }) : super(key: key);
 final double ?width;
 final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.h)
      ),
      elevation: 0,
      height: 40.h,
        minWidth: width,
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        child: Text('Add to Cart',style: TextStyle(color: Theme.of(context).backgroundColor),));
  }
}