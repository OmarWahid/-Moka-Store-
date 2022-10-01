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

class GetAllProductEvent extends MokaEvent {
  @override
  List<Object?> get props => [];
}

class CreateDataBaseEvent extends MokaEvent {
  @override
  List<Object?> get props => [];
}

class InsertToFavoritesDatabaseEvent extends MokaEvent {
  final ItemDetails itemDetails;

  const InsertToFavoritesDatabaseEvent(this.itemDetails);

  @override
  List<Object?> get props => [itemDetails];
}

class InsertToCartDatabaseEvent extends MokaEvent {
  final String name;
  final String price;
  final String image;
  final int count;

  const InsertToCartDatabaseEvent({
    required this.name,
    required this.price,
    required this.image,
    this.count = 1,
  });

  @override
  List<Object> get props => [name, price, image, count];
}

class GetFromFavoriteDatabaseEvent extends MokaEvent {
  @override
  List<Object?> get props => [];
}


class GetFromCartDatabaseEvent extends MokaEvent {
  @override
  List<Object?> get props => [];
}


class DeleteFromCartDatabaseEvent extends MokaEvent {
  final int id;

  const DeleteFromCartDatabaseEvent(this.id);

  @override
  List<Object> get props => [id];
}

class DeleteFromFavoriteDatabaseEvent extends MokaEvent {
  final int id;

  const DeleteFromFavoriteDatabaseEvent(this.id);

  @override
  List<Object> get props => [id];
}

class UpdateFromFavoriteDatabaseEvent extends MokaEvent {
  final int id;
  final int isLiked;

  const UpdateFromFavoriteDatabaseEvent(this.id, this.isLiked);

  @override
  List<Object> get props => [id, isLiked];
}


class UpdateFromCartDatabaseEvent extends MokaEvent {
  final int id;
  final int count;

  const UpdateFromCartDatabaseEvent(this.id, this.count);

  @override
  List<Object> get props => [id, count];
}



class IsInFavoriteDatabaseEvent extends MokaEvent {
  final ItemDetails itemDetails;

  const IsInFavoriteDatabaseEvent(this.itemDetails);

  @override
  List<Object> get props => [itemDetails];
}
class ChangeNumberOfPieceEvent extends MokaEvent {
  final String typeOfChange;

  const ChangeNumberOfPieceEvent(this.typeOfChange);

  @override
  List<Object> get props => [typeOfChange];
}

class SetNumberOfPieceEvent extends MokaEvent {
  @override
  List<Object?> get props => [];
}

class getFirstTokenEvent extends MokaEvent {
  final String price;

  const getFirstTokenEvent(this.price);

  @override
  List<Object> get props => [price];
}

class getOrderIdEvent extends MokaEvent {
  final String price;

  const getOrderIdEvent(this.price);

  @override
  List<Object> get props => [price];
}

class getFinalTokenCardVisaEvent extends MokaEvent {
  final String price;

  const getFinalTokenCardVisaEvent(this.price);

  @override
  List<Object> get props => [price];
}

class getFinalTokenKioskEvent extends MokaEvent {
  final String price;

  const getFinalTokenKioskEvent(this.price);

  @override
  List<Object> get props => [price];
}

class getReferenceCodeEvent extends MokaEvent {
  @override
  List<Object?> get props => [];
}