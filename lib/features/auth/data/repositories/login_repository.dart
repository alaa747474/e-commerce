
import 'package:e_commerce_app/core/utils/dio_helper.dart';
import 'package:e_commerce_app/features/auth/auth.dart';

class LoginRepository extends BaseLoginRepository {
  final DioHelper _dioHelper;

  LoginRepository(this._dioHelper);
  @override
  Future<void> login({required LoginModel loginModel}) async {
    await _dioHelper.postData(
      endPoint: 'auth/login',
      data: loginModel.tojson(),
    );
  }
}
