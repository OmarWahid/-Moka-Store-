import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moka_store/moka/presentation/screens/carts/carts_screen.dart';
import 'package:moka_store/moka/presentation/screens/favorites/favorites_screen.dart';
import 'package:moka_store/moka/presentation/screens/home/home_screen.dart';
import '../../../core/utils/enums_manager.dart';
import '../screens/settings/settings_screen.dart';
part 'moka_event.dart';

part 'moka_state.dart';

class MokaBloc extends Bloc<MokaEvent, MokaState> {
  static MokaBloc get(context) => BlocProvider.of(context);

  MokaBloc() : super(const MokaState()) {
    on<ChangeIndexEvent>(_changeIndexNavigationBar);
    on<IsSelectedItemProductsEvent>(_isSelected);
  }

  FutureOr<void> _isSelected(
      IsSelectedItemProductsEvent event, Emitter<MokaState> emit) {
    emit(state.copyWith(
      currentIndexItem: event.index,
    ));
  }

  FutureOr<void> _changeIndexNavigationBar(
      ChangeIndexEvent event, Emitter<MokaState> emit) {
   // print( "before ${state.currentIndexNavigation}");
    emit(state.copyWith(
      currentIndexNavigation: event.index,
    ));
    //print( "after ${state.currentIndexNavigation}");

  }
}
