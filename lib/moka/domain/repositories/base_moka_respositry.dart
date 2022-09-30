import 'package:dio/dio.dart';
import 'package:moka_store/moka/domain/entities/item_details.dart';

abstract class BaseMokaRepository {
  Future<List<ItemDetails>> getElectronicsProduct();

  Future<List<ItemDetails>> getSupermarketProduct();

  Future<List<ItemDetails>> getWatchesProduct();

  Future<List<ItemDetails>> getMenProduct();

  Future<List<ItemDetails>> getWomenProduct();

  Future<Response<dynamic>> getFirstToken(String price);

  Future<Response<dynamic>> getOrderId(String price);

  Future<Response<dynamic>> getFinalTokenCardVisa(String price);

  Future<Response<dynamic>> getFinalTokenKiosk(String price);

  Future<Response<dynamic>> getReferenceCode();
}
