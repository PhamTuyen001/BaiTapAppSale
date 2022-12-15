import 'package:dio/dio.dart';
import '../../../common/constants/api_constant.dart';
import 'dio_client.dart';

class ApiRequest {
  late Dio _dio;

  ApiRequest() {
    _dio = DioClient.instance.dio;
  }

  Future signUpRequest(
      String name,
      String email,
      String phone,
      String password,
      String address
      ) {
    return _dio.post(ApiConstant.SIGN_UP, data: {
      "name": name,
      "phone": phone,
      "address": address,
      "email": email,
      "password": password
    });
  }
}