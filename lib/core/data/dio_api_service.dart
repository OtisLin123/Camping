import 'package:camping/core/data/api_service.dart';
import 'package:camping/core/data/model/dio_service_error.dart';
import 'package:dio/dio.dart';

class DioApiService extends ApiService {
  final Dio dio = Dio();
  final int retryMaxTimes = 3;
  final int connectionTimeout = 5;
  final int sendTimeout = 5;

  @override
  Future<Response<dynamic>> fetchData({
    required String path,
    dynamic data,
  }) async {
    return _executeWithRetry(
      request: () => dio.fetch(
        RequestOptions(
          path: path,
          data: data,
          sendTimeout: const Duration(
            seconds: 5,
          ),
          connectTimeout: Duration(
            seconds: connectionTimeout,
          ),
        ),
      ),
    );
  }

  @override
  Future<Response<dynamic>> posthData({
    required String path,
    dynamic data,
  }) async {
    return _executeWithRetry(
      request: () => dio.post(
        path,
        data: data,
      ),
    );
  }

  Future<Response<dynamic>> _executeWithRetry({
    required Future<Response<dynamic>> Function() request,
  }) async {
    DioServiceError? error;
    int retryCount = 0;

    while (retryCount <= retryMaxTimes) {
      try {
        return await request.call();
      } on DioException catch (dioError) {
        error = _handleError(dioError);
        if (error.needRetry ?? false) {
          retryCount++;
          await Future.delayed(const Duration(seconds: 1));
        } else {
          throw Exception(error.message);
        }
      } catch (e) {
        throw Exception('An unexpected error occurred');
      }
    }
    throw Exception(
        'Retry time out after $retryMaxTimes attempts, last error: ${error?.message}');
  }

  DioServiceError _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DioServiceError(
          needRetry: true,
          isSuccess: false,
          message: 'connectionTimeout',
        );
      case DioExceptionType.sendTimeout:
        return DioServiceError(
          needRetry: true,
          isSuccess: false,
          message: 'sendTimeout',
        );
      case DioExceptionType.receiveTimeout:
        return DioServiceError(
          needRetry: true,
          isSuccess: false,
          message: 'receiveTimeout',
        );
      case DioExceptionType.badCertificate:
        return DioServiceError(
          needRetry: false,
          isSuccess: false,
          message: 'badCertificate',
        );
      case DioExceptionType.badResponse:
        return DioServiceError(
          needRetry: true,
          isSuccess: false,
          message: 'badResponse',
        );
      case DioExceptionType.cancel:
        return DioServiceError(
          needRetry: false,
          isSuccess: false,
          message: 'cancel',
        );
      case DioExceptionType.connectionError:
        return DioServiceError(
          needRetry: false,
          isSuccess: false,
          message: 'connectionError',
        );
      default:
        return DioServiceError(
          needRetry: false,
          isSuccess: false,
          message: 'an unexcepted error occurred',
        );
    }
  }
}
