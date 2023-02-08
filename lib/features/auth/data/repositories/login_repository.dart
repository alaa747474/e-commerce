import 'package:e_commerce_app/features/auth/data/models/login_model.dart';
import 'package:e_commerce_app/features/auth/data/repositories/base_login_repository.dart';
import 'package:e_commerce_app/core/utils/dio_helper.dart';

class LoginRepository extends BaseLoginRepository {
  @override
  Future<void> login({required LoginModel loginModel}) async {
    await DioHelper.postData(
      endPoint: 'auth/login',
      data: loginModel.tojson(),
    );
  }
}
