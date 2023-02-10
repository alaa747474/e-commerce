import 'package:dio/dio.dart';

class DioHelper {
  final Dio _dio;
  DioHelper(this._dio);

  Future getData({required String endPoint}) async {
    Response response = await _dio.get(endPoint);
    return response.data;
  }

  Future postData({required String endPoint, dynamic data}) async {
    await _dio.post(endPoint, data: data);
  }
}
