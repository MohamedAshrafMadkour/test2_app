import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioError({required DioException dioException}) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: 'Connection Timeout With Api Server',
        );

      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send Timeout With Api Server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Recevive Timeout With Api Server');

      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Bad Certificate With Api Server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromBasResponce(
          statusCode: dioException.response!.statusCode!,
          response: dioException.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Request Canceled With Api Server');

      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'Connection Error With Api Server');

      case DioExceptionType.unknown:
        return ServerFailure(errorMessage: 'Unknown Error With Api Server');
    }
  }

  factory ServerFailure.fromBasResponce({
    required int statusCode,
    required dynamic response,
  }) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
        errorMessage: 'Your request not found, Please try again later',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errorMessage: 'Internal Server Error, Please try again later',
      );
    } else {
      return ServerFailure(
        errorMessage: 'Something went wrong, Please try again later',
      );
    }
  }
}
