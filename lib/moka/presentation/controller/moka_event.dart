part of 'moka_bloc.dart';

abstract class MokaEvent extends Equatable {
  const MokaEvent();
}

class ChangeIndexEvent extends MokaEvent {
  final int index;

  const ChangeIndexEvent(this.index);

  @override
  List<Object> get props => [index];
}

class IsSelectedItemProductsEvent extends MokaEvent {
  final int index;

  const IsSelectedItemProductsEvent(this.index);

  @override
  List<Object> get props => [index];
}
