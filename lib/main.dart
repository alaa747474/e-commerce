import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/core/router/app_router.dart';
import 'package:e_commerce_app/core/utils/theme.dart';
import 'package:e_commerce_app/features/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'features/auth/auth.dart';
import 'features/cart/cart.dart';
import 'features/categories/categories.dart';
import 'features/onboarding/onboarding.dart';
import 'features/products/products.dart';

void main()async {
  serviceLocatorSetup();
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
          create: (context) => LoginCubit(getIt.get<LoginRepository>()),
        ),
        BlocProvider(create: (context) => ProductCubit(getIt.get<ProductRepository>())..getAllProducts(),
        ),
         BlocProvider(create: (context) => CategoryCubit(getIt.get<CategoryRepository>())..getCategoriesName(),
        ),
        BlocProvider(create: (context) => CartCubit(getIt.get<CartLocalStorageRepository>())..loadCart(),
        ),
        BlocProvider(create: (context) => SearchCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize:const Size(380, 690) ,
        splitScreenMode:true,
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) { 
        return  MaterialApp(
        onGenerateRoute: AppRouer.generateRoute,
        theme: theme(),
        debugShowCheckedModeBanner: false,
        home: showHome?const ProductsScreen(userName: 'userName'):const OnboardingScreen(),
          );}
      )
    );
  }
}
