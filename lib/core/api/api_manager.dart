import 'package:dio/dio.dart';

class DioHelper {
  static late final Dio dio;
  static initDio() {
    dio = Dio();
  }

  static Future<Response> getData(String path,
      {Map<String, dynamic>? query}) async {
    return await dio.get(
      path,
      queryParameters: query ?? {},
    );
  }

  static Future<Response> postData(String path,
      {Map<String, dynamic>? data}) async {
    Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        });
    dio.options.headers = {};
    return await dio.post(
      path,
      data: data ?? {},
    );
  }
}
