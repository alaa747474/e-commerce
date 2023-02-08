import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utils/constants.dart';

class DioHelper{
static late Dio _dio;
 static BaseOptions options=BaseOptions(
  baseUrl: baseUrl,
  receiveTimeout: 30*1000,
  receiveDataWhenStatusError: true,);
 
 static init(){
  _dio=Dio(options);
 }
 static Future getData({required String endPoint})async{
  Response response=await _dio.get(endPoint);
  return response.data;
 }
 static Future postData({required String endPoint,dynamic data})async{
   await _dio.post(endPoint,data: data);
 }
}
