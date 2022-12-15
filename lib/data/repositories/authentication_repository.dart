import 'dart:async';
import 'package:baitap_appsale/data/datasources/remote/api_request.dart';
import 'package:dio/dio.dart';
import '../datasources/remote/dto/app_resource.dart';
import '../datasources/remote/dto/user_dto.dart';

class AuthenticationRepository {
  late ApiRequest _apiRequest;

  void updateApiRequest(ApiRequest apiRequest){
    _apiRequest = apiRequest;
  }


  Future<AppResource<UserDTO>> signUp(String email, String password, String phone, String name, String address) async{
    Completer<AppResource<UserDTO>> completer = Completer();
    try {
      // Response
      Response<dynamic> response =
      await _apiRequest.signUpRequest(name, email, phone, password, address);
      // Parse JSON
      AppResource<UserDTO> resourceUserDTO =
      AppResource.fromJson(response.data, UserDTO.fromJson);
      completer.complete(resourceUserDTO);
    }
    on DioError catch (dioError) {completer.completeError(dioError.response?.data["message"]);}
    catch(e) {completer.completeError(e.toString());}
    return completer.future;
  }


}