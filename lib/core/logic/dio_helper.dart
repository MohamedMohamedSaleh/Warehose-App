import 'package:dio/dio.dart';

class DioHelper {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://5d8pkv7x4f.execute-api.us-east-1.amazonaws.com/sta1/",
  ));

  static Future<ResponseData> sendData(
      {required String endPoint,
      Map<String, dynamic>? data,
      bool isLogin = false}) async {
    try {
      final response = await _dio.post(
        endPoint,
        data: data,
      );

      return ResponseData(
          message: isLogin ? "Login Successfull" : (response.data).toString(),
          isSuccess: true,
          response: response);
    } on DioException catch (ex) {
      return ResponseData(
          message: ex.response!.data, isSuccess: false, response: ex.response);
    }
  }

  static Future<ResponseData> getData({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      var response = await _dio.get(endPoint, data: data);
      return ResponseData(message: '', isSuccess: true, response: response);
    } on DioException catch (ex) {
      return ResponseData(
          message: ex.response!.data.toString() , isSuccess: false, response: ex.response);
    }
  }
}

class ResponseData {
  late final String message;
  late final bool isSuccess;
  late final Response? response;

  ResponseData({required this.message, required this.isSuccess, this.response});
}
