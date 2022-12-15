import 'dart:async';

import 'package:dio/dio.dart';

import '../datasources/remote/api_request.dart';
import '../datasources/remote/dto/app_resource.dart';
import '../datasources/remote/dto/cart_dto.dart';

class CartRespository{
  late ApiRequest _apiRequest;

  void updateApiRequest(ApiRequest apiRequest){
    _apiRequest = apiRequest;
  }

  Future<AppResource<CartDTO>> getCart() async{
    Completer<AppResource<CartDTO>> completer = Completer();
    try{
      Response<dynamic> response = await _apiRequest.getCart();
      AppResource<CartDTO> resourceDTO = AppResource.fromJson(response.data, CartDTO.parser);
      completer.complete(resourceDTO);
    }catch(e){
      completer.completeError(e);
    }
    return completer.future;
  }

}