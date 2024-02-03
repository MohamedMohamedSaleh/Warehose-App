import 'package:dio/dio.dart';

class DioHelper {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://6p7ompdw2b.execute-api.us-east-1.amazonaws.com/sta1/",
  ));

  Future<ResponseData> sendData({required String endPoint,  Map<String, dynamic>? data, bool isLogin = false}) async {
    try {
      final response = await _dio.post(
        endPoint,
        data: data,
      );

      return ResponseData(
          message:isLogin? "Login Successfull" : (response.data).toString(), isSuccess: true, response: response);
    } on DioException catch (ex) {
      return ResponseData(
          message: (ex.response!.data).toString(), isSuccess: false, response: ex.response);
    }
  }
}

class ResponseData {
  late final String message;
  late final bool isSuccess;
  late final Response? response;

  ResponseData({required this.message, required this.isSuccess, this.response});
}
