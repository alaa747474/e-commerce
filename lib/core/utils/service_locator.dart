import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/utils/dio_helper.dart';
import 'package:e_commerce_app/features/auth/auth.dart';
import 'package:e_commerce_app/features/cart/data/repositories/cart_local_storage_repository.dart';
import 'package:e_commerce_app/features/categories/data/repositories/category_repository.dart';
import 'package:e_commerce_app/features/products/data/repositories/product_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void serviceLocatorSetup() {

  getIt.registerSingleton<DioHelper>(DioHelper(dioSetUp()));
  getIt.registerSingleton<LoginRepository>(
      LoginRepository(getIt.get<DioHelper>()));
  getIt.registerSingleton<ProductRepository>(
      ProductRepository(getIt.get<DioHelper>()));
  getIt.registerSingleton<CategoryRepository>(
      CategoryRepository(getIt.get<DioHelper>()));
  getIt.registerSingleton<CartLocalStorageRepository>(
      CartLocalStorageRepository());
}

Dio dioSetUp() {
    Dio dio = Dio();
    
    dio
      ..options.baseUrl=baseUrl
      ..options.connectTimeout = 30 * 1000
      ..options.receiveTimeout = 30 * 1000;

    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true,
    ));

    return dio;
  }