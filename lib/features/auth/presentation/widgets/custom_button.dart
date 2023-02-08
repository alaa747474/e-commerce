
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key, required this.onPressed, required this.text,
  }) : super(key: key);
 final VoidCallback onPressed;
 final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Theme.of(context).cardColor,
      onPressed:onPressed,
      color: Theme.of(context).primaryColor,
      elevation: 0,
      height: 60,
      minWidth: MediaQuery.of(context).size.width,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)),
      child: Center(child: Text(text,style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),),),    
    );
  }
}