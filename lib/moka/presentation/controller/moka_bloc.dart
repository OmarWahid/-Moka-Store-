import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moka_store/moka/domain/entities/item_details.dart';
import 'package:moka_store/moka/domain/use_cases/get_electronics_use_case.dart';
import 'package:moka_store/moka/presentation/screens/carts/carts_screen.dart';
import 'package:moka_store/moka/presentation/screens/favorites/favorites_screen.dart';
import 'package:moka_store/moka/presentation/screens/home/home_screen.dart';
import 'package:sqflite/sqflite.dart';
import '../../../config/shared/constant.dart';
import '../../../core/utils/enums_manager.dart';
import '../../domain/use_cases/get_men_use_case.dart';
import '../../domain/use_cases/get_supermarket_use_case.dart';
import '../../domain/use_cases/get_watches_use_case.dart';
import '../../domain/use_cases/get_women_use_case.dart';
import '../screens/settings/settings_screen.dart';

part 'moka_event.dart';

part 'moka_state.dart';

class MokaBloc extends Bloc<MokaEvent, MokaState> {
  final GetElectronicsProductUseCase getElectronicsProductUseCase;
  final GetSupermarketProductUseCase getSupermarketProductUseCase;
  final GetMenProductUseCase getMenProductUseCase;
  final GetWomenProductUseCase getWomenProductUseCase;
  final GetWatchesProductUseCase getWatchesProductUseCase;

  static MokaBloc get(context) => BlocProvider.of(context);

  MokaBloc(
    this.getWomenProductUseCase,
    this.getWatchesProductUseCase,
    this.getMenProductUseCase,
    this.getSupermarketProductUseCase,
    this.getElectronicsProductUseCase,
  ) : super(const MokaState()) {
    on<ChangeIndexEvent>(_changeIndexNavigationBar);
    on<IsSelectedItemProductsEvent>(_isSelected);
    on<GetElectronicsProductEvent>(_getElectronicsProduct);
    on<GetSupermarketProductEvent>(_getSupermarketProduct);
    on<GetMenProductEvent>(_getMenProduct);
    on<GetWomenProductEvent>(_getWomenProduct);
    on<GetWatchesProductEvent>(_getWatchesProduct);
    on<CreateDataBaseEvent>(_createDataBase);
    on<InsertToDatabaseEvent>(_insertToDatabase);
    on<GetFromDatabaseEvent>(_getFromDatabase);
    on<DeleteFromDatabaseEvent>(_deleteFromDatabase);
  }

  FutureOr<void> _isSelected(
      IsSelectedItemProductsEvent event, Emitter<MokaState> emit) {
    List<ItemDetails> nowProduct = [];
    if (event.index == 0) nowProduct = state.electronicsProduct;
    if (event.index == 1) nowProduct = state.menProduct;
    if (event.index == 2) nowProduct = state.womenProduct;
    if (event.index == 3) nowProduct = state.watchesProduct;
    if (event.index == 4) nowProduct = state.supermarketProduct;

    emit(state.copyWith(
      currentIndexItem: event.index,
      currentProduct: nowProduct,
    ));
  }

  FutureOr<void> _changeIndexNavigationBar(
      ChangeIndexEvent event, Emitter<MokaState> emit) {
    emit(state.copyWith(
      currentIndexNavigation: event.index,
    ));
  }

  FutureOr<void> _getElectronicsProduct(
      GetElectronicsProductEvent event, Emitter<MokaState> emit) async {
    final result = await getElectronicsProductUseCase();
    electronicsProductConstant = result;
    emit(state.copyWith(
      electronicsProduct: result,
      currentProduct: result,
      electronicsProductState: RequestState.loaded,
      currentProductState: RequestState.loaded,
    ));
  }

  FutureOr<void> _getSupermarketProduct(
      GetSupermarketProductEvent event, Emitter<MokaState> emit) async {
    final result = await getSupermarketProductUseCase();
    supermarketProductConstant = result;
    emit(state.copyWith(
      supermarketProduct: result,
      supermarketProductState: RequestState.loaded,
    ));
  }

  FutureOr<void> _getWatchesProduct(
      GetWatchesProductEvent event, Emitter<MokaState> emit) async {
    final result = await getWatchesProductUseCase();
    watchesProductConstant = result;
    emit(state.copyWith(
      watchesProduct: result,
      watchesProductState: RequestState.loaded,
    ));
  }

  FutureOr<void> _getMenProduct(
      GetMenProductEvent event, Emitter<MokaState> emit) async {
    final result = await getMenProductUseCase();
    menProductConstant = result;
    emit(state.copyWith(
      menProduct: result,
      menProductState: RequestState.loaded,
    ));
  }

  FutureOr<void> _getWomenProduct(
      GetWomenProductEvent event, Emitter<MokaState> emit) async {
    final result = await getWomenProductUseCase();
    womenProductConstant = result;
    emit(state.copyWith(
      womenProduct: result,
      womenProductState: RequestState.loaded,
    ));
  }

  FutureOr<void> _createDataBase(
      CreateDataBaseEvent event, Emitter<MokaState> emit) async {
    print('DataBase Created !');

    await openDatabase('carts.db', version: 1, onCreate: (db, version) {
      db.execute(
        'CREATE TABLE carts (id INTEGER PRIMARY KEY, name TEXT, price TEXT, image TEXT, quantity INTEGER)',
      );
    }, onOpen: (db) {
      add(GetFromDatabaseEvent());
      emit(state.copyWith(
        database: db,
      ));
      print('DataBase Opened !');
    });
  }

  FutureOr<void> _insertToDatabase(
      InsertToDatabaseEvent event, Emitter<MokaState> emit) async {
    final database = state.database;
    await database!.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO carts(name, price, image, quantity) VALUES(?, ?, ?, ?)',
          [
            event.name,
            event.price,
            event.image,
            event.count,
          ]);
      add(GetFromDatabaseEvent());
      Fluttertoast.showToast(
        msg: 'Added successfully ✔',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      print('inserted1: $id1');
    });
  }

  FutureOr<void> _getFromDatabase(
      GetFromDatabaseEvent event, Emitter<MokaState> emit) async {
    final database = state.database;
    List<Map> cartItems = [];
    if (database != null) {
      await database.rawQuery('SELECT * FROM carts').then((value) {
        for (var element in value) {
          cartItems.add(element);
        }
        print('success get from database');
        cartConstant = cartItems;
        emit(state.copyWith(
          cartItems: cartItems,
        ));
      });
    }

  }

  FutureOr<void> _deleteFromDatabase(
      DeleteFromDatabaseEvent event, Emitter<MokaState> emit) async {
    final database = state.database;
    await database!.transaction((txn) async {
      int id1 =
          await txn.rawDelete('DELETE FROM carts WHERE id = ?', [event.id]);
      add(GetFromDatabaseEvent());
      print('deleted1: $id1');
    });
  }
}
