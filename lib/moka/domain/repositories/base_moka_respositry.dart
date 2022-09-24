

import 'package:moka_store/moka/domain/entities/item_details.dart';

abstract class BaseMokaRepository {

  Future<List<ItemDetails>> getElectronicsProduct();

  Future<List<ItemDetails>> getSupermarketProduct();


}