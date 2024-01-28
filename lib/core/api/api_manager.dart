import 'package:black_market/core/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class DioHelper {
  static late final Dio dio;
  static initDio() {
    dio = Dio();
  }

  static Future<Response> getData(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    var box = Hive.box<String>('user');
    var token = box.get(Constant.accessToken);
    dio.options.headers = {
        'Authorization':'Bearer $token'
    };

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
