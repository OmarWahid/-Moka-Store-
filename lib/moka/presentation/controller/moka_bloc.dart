import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moka_store/moka/domain/entities/item_details.dart';
import 'package:moka_store/moka/domain/use_cases/get_electronics_use_case.dart';
import 'package:moka_store/moka/presentation/screens/carts/carts_screen.dart';
import 'package:moka_store/moka/presentation/screens/favorites/favorites_screen.dart';
import 'package:moka_store/moka/presentation/screens/home/home_screen.dart';
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
}
