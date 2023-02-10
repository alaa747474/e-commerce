part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
class LoginInProgress extends LoginState{}
class LogedIn extends LoginState{}
class LoginErorr extends LoginState{
  
}
class ShowPasswordState extends LoginState{
  final bool isShowen;
@override
  List<Object> get props => [isShowen];
  const ShowPasswordState(this.isShowen);
}
