import 'dart:async';
import 'package:dio/dio.dart';
import '../datasources/remote/api_request.dart';
import '../datasources/remote/dto/app_resource.dart';
import '../datasources/remote/dto/product_dto.dart';
class ProductRepository {
  late ApiRequest _apiRequest;

  void updateApiRequest(ApiRequest apiRequest) {
    _apiRequest = apiRequest;
  }

  Future<AppResource<List<ProductDTO>>> getProducts() async{
    Completer<AppResource<List<ProductDTO>>> completer = Completer();
    try {
      Response<dynamic> response =  await _apiRequest.getProducts();
      // TODO: Improve use Isolate
      AppResource<List<ProductDTO>> resourceProductDTO = AppResource.fromJson(response.data, (listData){
        return (listData as List).map((e) => ProductDTO.fromJson(e)).toList();
      });
      completer.complete(resourceProductDTO);
    } on DioError catch (dioError) {
      completer.completeError(dioError.response?.data["message"]);
    } catch(e) {
      completer.completeError(e.toString());
    }
    return completer.future;
  }
}