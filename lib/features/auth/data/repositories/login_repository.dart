import 'package:e_commerce_app/features/auth/data/models/login_model.dart';
import 'package:e_commerce_app/features/auth/data/repositories/base_login_repository.dart';
import 'package:e_commerce_app/core/utils/dio_helper.dart';

class LoginRepository extends BaseLoginRepository {
  final DioSrvice _dioSrvice;

  LoginRepository(this._dioSrvice);
  @override
  Future<void> login({required LoginModel loginModel}) async {
    await _dioSrvice.postData(
      endPoint: 'auth/login',
      data: loginModel.tojson(),
    );
  }
}
