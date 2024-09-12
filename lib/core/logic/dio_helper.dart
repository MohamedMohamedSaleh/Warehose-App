import 'package:dio/dio.dart';

class DioHelper {
  // delete base url
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: "",
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
          message: ex.response?.data.toString()?? "NOt Connected!",
          isSuccess: false,
          response: ex.response);
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
          message: ex.response?.data.toString()?? "Not Connected!",
          isSuccess: false,
          response: ex.response);
    }
  }
}

class ResponseData {
  late final String message;
  late final bool isSuccess;
  late final Response? response;

  ResponseData({required this.message, required this.isSuccess, this.response});
}
