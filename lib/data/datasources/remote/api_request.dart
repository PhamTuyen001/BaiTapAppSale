import 'dart:isolate';

import 'package:dio/dio.dart';
import '../../../common/constants/api_constant.dart';
import '../../../common/constants/variable_constant.dart';
import '../local/cache/app_cache.dart';
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

  Future signInRequest(String email, String password) {
    return _dio.post(ApiConstant.SIGN_IN, data: {
      "email": email,
      "password": password
    });
  }


  Future getProducts() {
    return _dio.get(ApiConstant.PRODUCTS);
  }

  Future getCart() {
    return _dio.get(ApiConstant.CART,
        options: Options(
            headers: {
              "authorization":"Bearer ${AppCache.getString(VariableConstant.TOKEN)}"
            }
        )
    );
  }


}