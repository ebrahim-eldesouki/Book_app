import 'package:dio/dio.dart';

abstract class Failures {
  final String errormsg;

  const Failures(this.errormsg);
}

class ServerFailure extends Failures {
  ServerFailure(super.errormsg);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error');

      case DioExceptionType.unknown:
        return ServerFailure('Un expected error happand try again ');

        
    }
    
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('method not found try again later ');
    } else if (statusCode == 500) {
      return ServerFailure('internal server error try again later ');
    } else {
      return ServerFailure('oops there was an error try again later ');
    }
  }
}
