import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class RemoteServerFailure extends Failure {
  RemoteServerFailure(super.message);
  factory RemoteServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return RemoteServerFailure(
            'Connection to API server failed due to internet connection');
      case DioExceptionType.sendTimeout:
        return RemoteServerFailure('Send Timeout');
      case DioExceptionType.receiveTimeout:
        return RemoteServerFailure('Receive Timeout');
      case DioExceptionType.badResponse:
        return RemoteServerFailure.fromResponse(
            dioException.response?.statusCode);
      case DioExceptionType.cancel:
        return RemoteServerFailure('Request to API server was cancelled');
      case DioExceptionType.unknown:
        return RemoteServerFailure(
            'Connection to API server failed due to internet connection');
      default:
        return RemoteServerFailure('Something went wrong');
    }
  }
  factory RemoteServerFailure.fromResponse(int? statusCode) {
    switch (statusCode) {
      case 400:
        return RemoteServerFailure('Bad Request');
      case 422:
        return RemoteServerFailure('invaild email or password');
      case 403:
        return RemoteServerFailure('Forbidden');
      case 404:
        return RemoteServerFailure('Not Found');
      case 500:
        return RemoteServerFailure('Internal Server Error');
      case 503:
        return RemoteServerFailure('Service Unavailable');
      default:
        return RemoteServerFailure('Something went wrong');
    }
  }
}
