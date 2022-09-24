import 'package:moka_store/moka/data/data_sources/moka_remote_data_source.dart';
import 'package:moka_store/moka/domain/entities/item_details.dart';
import 'package:moka_store/moka/domain/repositories/base_moka_respositry.dart';

class MokaRepository extends BaseMokaRepository{
 final BaseMokaRemoteDataSource baseMokaRemoteDataSource;

  MokaRepository(this.baseMokaRemoteDataSource);


  @override
  Future<List<ItemDetails>> getElectronicsProduct() async{
    return await baseMokaRemoteDataSource.getElectronicsProduct();
  }

  @override
  Future<List<ItemDetails>> getSupermarketProduct() async{
   return await baseMokaRemoteDataSource.getSupermarketProduct();
  }

}