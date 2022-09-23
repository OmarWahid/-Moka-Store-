import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moka_store/moka/domain/entities/item_details.dart';
import 'package:moka_store/moka/domain/use_cases/get_electronics_use_case.dart';
import 'package:moka_store/moka/presentation/screens/carts/carts_screen.dart';
import 'package:moka_store/moka/presentation/screens/favorites/favorites_screen.dart';
import 'package:moka_store/moka/presentation/screens/home/home_screen.dart';
import '../../../core/utils/enums_manager.dart';
import '../screens/settings/settings_screen.dart';

part 'moka_event.dart';

part 'moka_state.dart';

class MokaBloc extends Bloc<MokaEvent, MokaState> {
  final GetElectronicsProductUseCase getElectronicsProductUseCase;

  static MokaBloc get(context) => BlocProvider.of(context);

  MokaBloc(this.getElectronicsProductUseCase) : super(const MokaState()) {
    on<ChangeIndexEvent>(_changeIndexNavigationBar);
    on<IsSelectedItemProductsEvent>(_isSelected);
    on<GetElectronicsProductEvent>(_getElectronicsProduct);
  }

  FutureOr<void> _isSelected(
      IsSelectedItemProductsEvent event, Emitter<MokaState> emit) {
    List<ItemDetails> nowProduct = [];
    if (event.index == 0) nowProduct = state.electronicsProduct;
    if (event.index == 1) nowProduct = state.electronicsProduct;
    if (event.index == 2) nowProduct = state.electronicsProduct;
    if (event.index == 3) nowProduct = state.electronicsProduct;
    if (event.index == 4) nowProduct = state.electronicsProduct;

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
    emit(state.copyWith(
      electronicsProduct: result,
      currentProduct: result,
      electronicsProductState: RequestState.loaded,
      currentProductState: RequestState.loaded,
    ));
    print(state.currentProduct);
  }
}
