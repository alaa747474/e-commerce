import 'package:e_commerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:e_commerce_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:e_commerce_app/features/categories/presentation/screens/categories_screen.dart';
import 'package:e_commerce_app/features/products/data/models/product.dart';
import 'package:e_commerce_app/features/products/presentation/screens/product_details_screen.dart';
import 'package:e_commerce_app/features/products/presentation/screens/product_screen.dart';
import 'package:e_commerce_app/features/search/presentation/screens/search_screen.dart';

import 'package:flutter/material.dart';

class AppRouer {
 static Route generateRoute(RouteSettings settings){
    switch (settings.name) {
      case SearchScreen.routeName:
      final products =settings.arguments as List<Product>;
      return MaterialPageRoute(builder: (_)=> SearchScreen(products: products,));  
      case  LoginScreen.routeName:
      return MaterialPageRoute(builder: (_)=>const LoginScreen());  
      case ProductsScreen.routeName:
      final userName=settings.arguments as String;
      return MaterialPageRoute(builder: (_)=> ProductsScreen(userName:userName ,)); 
      case ProductDetailsScreen.routeName:
      final product=settings.arguments as Product;
      return MaterialPageRoute(builder: (_)=> ProductDetailsScreen(product: product));
      case CartegoriesScreen.routeName:
      final index=settings.arguments as int;
      return MaterialPageRoute(builder: (_)=> CartegoriesScreen(categoryIndex: index,));  
      case CartScreen.routeName:
      return MaterialPageRoute(builder: (_)=>const CartScreen());  
    }
    return MaterialPageRoute(builder: (_)=>const LoginScreen());  
  }
}