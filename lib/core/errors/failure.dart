// import 'package:dio/dio.dart';

// abstract class Failure {
//     final String errorMessage;

//   Failure(this.errorMessage);
// }
// class ServerFailure extends Failure {
//   ServerFailure(super.errorMessage);
//   factory ServerFailure.fromDioError(DioError dioError){
//     switch (dioError.type) {
//       case DioErrorType.connectTimeout :
//         return ServerFailure('Connect Timeout !!!');
//      case DioErrorType.receiveTimeout :
//         return ServerFailure('Receive Timeout !!!');
//      case DioErrorType.sendTimeout :
//         return ServerFailure('Send Timeout !!!');    
//      case DioErrorType.cancel :
//         return ServerFailure('Request canceld !!!');    
//     case DioErrorType.response:
//         return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data); 
//     case DioErrorType.other:
//         return ServerFailure('Unexpected Error!!!'); 
//     }
//   }
//   factory ServerFailure.fromResponse(int statusCode,dynamic response){
//     if (statusCode==401) {
//       return ServerFailure('username or password is incorrect');
//     }else{
//       return ServerFailure('something went wrong');
//     }
//   }
// }