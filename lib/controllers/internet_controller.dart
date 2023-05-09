import 'package:dio/dio.dart';

class ConnectivityInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Check for internet connection here
    // If internet connection is not available, throw an error
    // Otherwise, proceed with the API call
    return super.onRequest(options, handler);
  }
}