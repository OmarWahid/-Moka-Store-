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

class GetElectronicsProductEvent extends MokaEvent {
  @override
  List<Object?> get props => [];
}

class GetSupermarketProductEvent extends MokaEvent {
  @override
  List<Object?> get props => [];
}

class GetMenProductEvent extends MokaEvent {
  @override
  List<Object?> get props => [];
}

class GetWomenProductEvent extends MokaEvent {
  @override
  List<Object?> get props => [];
}

class GetWatchesProductEvent extends MokaEvent {
  @override
  List<Object?> get props => [];
}

class CreateDataBaseEvent extends MokaEvent {
  @override
  List<Object?> get props => [];
}

class InsertToDatabaseEvent extends MokaEvent {
  final String name;
  final String price;
  final String image;
  final int count;

  const InsertToDatabaseEvent({
    required this.name,
    required this.price,
    required this.image,
    this.count = 1,
  });

  @override
  List<Object> get props => [name, price, image, count];
}

class GetFromDatabaseEvent extends MokaEvent {
  @override
  List<Object?> get props => [];
}

class DeleteFromDatabaseEvent extends MokaEvent {
  final int id;

  const DeleteFromDatabaseEvent(this.id);

  @override
  List<Object> get props => [id];
}

class UpdateFromDatabaseEvent extends MokaEvent {
  final int id;
  final int count;

  const UpdateFromDatabaseEvent(this.id, this.count);

  @override
  List<Object> get props => [id, count];
}
