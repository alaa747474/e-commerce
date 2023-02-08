import 'package:e_commerce_app/features/auth/auth.dart';
import 'package:e_commerce_app/features/cart/business_logic/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/data/repositories/cart_local_storage_repository.dart';
import 'package:e_commerce_app/features/categories/business_logic/cubit/category_cubit.dart';
import 'package:e_commerce_app/features/categories/data/repositories/category_repository.dart';
import 'package:e_commerce_app/features/onboarding/presentation/on_boarding_screen.dart';
import 'package:e_commerce_app/features/products/business_logic/cubit/product_cubit.dart';
import 'package:e_commerce_app/features/products/data/models/product.dart';
import 'package:e_commerce_app/features/products/data/models/rating.dart';
import 'package:e_commerce_app/features/products/data/repositories/product_repository.dart';
import 'package:e_commerce_app/features/products/presentaion/screens/product_screen.dart';
import 'package:e_commerce_app/core/router/app_router.dart';
import 'package:e_commerce_app/core/utils/dio_helper.dart';
import 'package:e_commerce_app/core/utils/theme.dart';
import 'package:e_commerce_app/features/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main()async {
  DioHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(RatingAdapter());
  Box box=await Hive.openBox('MyBox');
  final showHome= box.get('ShowHome')??false;
  runApp( MyApp(showHome: showHome,));
}
class MyApp extends StatelessWidget {
 final bool showHome;
  const MyApp({super.key,required this.showHome});
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(LoginRepository()),
        ),
        BlocProvider(create: (context) => ProductCubit(ProductRepository())..getAllProducts(),
        ),
         BlocProvider(create: (context) => CategoryCubit(CategoryRepository())..getCategoriesName(),
        ),
        BlocProvider(create: (context) => CartCubit(CartLocalStorageRepository())..loadCart(),
        ),
        BlocProvider(create: (context) => SearchCubit(),
        ),
      ],
      child: MaterialApp(
      onGenerateRoute: AppRouer.generateRoute,
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: showHome?const ProductsScreen(userName: 'userName'):const OnboardingScreen(),
    )
    );
  }
}
