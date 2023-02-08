import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/auth/data/models/login_model.dart';
import 'package:e_commerce_app/features/auth/data/repositories/login_repository.dart';
import 'package:e_commerce_app/core/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepository) : super(LoginInitial());
  final LoginRepository _loginRepository;
  login({required LoginModel loginModel, required BuildContext context}) async {
    try {
      emit(LoginInProgress());
      await _loginRepository.login(loginModel: loginModel);
      emit(LogedIn());
    } catch (e) {
      showCustomSnackBar(context: context, content: e.toString());
    }
  }
  bool isShowen = true;
  showPassword() {
    isShowen = !isShowen;
    emit(ShowPasswordState(isShowen));
  }
}
