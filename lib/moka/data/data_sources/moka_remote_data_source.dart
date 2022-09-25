import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moka_store/moka/data/models/item_details_model.dart';

abstract class BaseMokaRemoteDataSource {
  Future<List<ItemDetailsModel>> getElectronicsProduct();

  Future<List<ItemDetailsModel>> getSupermarketProduct();

  Future<List<ItemDetailsModel>> getWatchesProduct();

  Future<List<ItemDetailsModel>> getMenProduct();

  Future<List<ItemDetailsModel>> getWomenProduct();
}

/// no handle error because it's handled in the repository
/// im backend i sure that the data is correct
/// the data is correct because i'm the one who created it
/// i know it's wrong but it's just a test

class MokaRemoteDataSource extends BaseMokaRemoteDataSource {
  @override
  Future<List<ItemDetailsModel>> getElectronicsProduct() async {
    List<ItemDetailsModel> result = [];
    final response =
        await FirebaseFirestore.instance.collection('electronics').get();

    for (var element in response.docs) {
      result.add(ItemDetailsModel.fromJson(element.data()));
    }
    return result;
  }

  @override
  Future<List<ItemDetailsModel>> getSupermarketProduct() async {
    List<ItemDetailsModel> result = [];
    final response =
        await FirebaseFirestore.instance.collection('supermarket').get();

    for (var element in response.docs) {
      result.add(ItemDetailsModel.fromJson(element.data()));
    }
    return result;
  }

  @override
  Future<List<ItemDetailsModel>> getMenProduct() async {
    List<ItemDetailsModel> result = [];
    final response = await FirebaseFirestore.instance.collection('men').get();

    for (var element in response.docs) {
      result.add(ItemDetailsModel.fromJson(element.data()));
    }
    return result;
  }

  @override
  Future<List<ItemDetailsModel>> getWatchesProduct() async {
    List<ItemDetailsModel> result = [];
    final response =
        await FirebaseFirestore.instance.collection('watches').get();

    for (var element in response.docs) {
      result.add(ItemDetailsModel.fromJson(element.data()));
    }
    return result;
  }

  @override
  Future<List<ItemDetailsModel>> getWomenProduct() async {
    List<ItemDetailsModel> result = [];
    final response = await FirebaseFirestore.instance.collection('women').get();

    for (var element in response.docs) {
      result.add(ItemDetailsModel.fromJson(element.data()));
    }
    return result;
  }
}
