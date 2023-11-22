// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with Apiserver');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with Apiserver');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with Apiserver');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certification');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(
            'Request to api server was canceled, please try again later!');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection, please try again later!');
      case DioExceptionType.unknown:
        return ServerFailure(
            'Opps there was an error, please try again later!');
      default:
        return ServerFailure(
            'Opps there was an error, please try again later!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, please try again later!');
    } else {
      return ServerFailure('Opps there was an error, please try again later!');
    }
  }
}
