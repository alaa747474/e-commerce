import 'package:e_commerce_app/features/auth/data/models/login_model.dart';

abstract class BaseLoginRepository {
  Future<void>login({required LoginModel loginModel});
}