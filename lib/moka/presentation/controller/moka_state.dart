part of 'moka_bloc.dart';

class MokaState extends Equatable {
  final int? currentIndexNavigation;
  final int? currentIndexItem;
  final int? menuRefresh;
  final List<ProductSelectedState>? compare1;
  final List<Widget>? screens;
  final ProductSelectedState? itemSelected;

  const MokaState({this.currentIndexItem = 0,
    this.currentIndexNavigation = 0,
    this.menuRefresh = 0,
    this.screens = const [
      HomeScreen(),
      FavoritesScreen(),
      CartsScreen(),
      SettingsScreen(),
    ],
    this.itemSelected = ProductSelectedState.men,
    this.compare1 = const [
      ProductSelectedState.men,
      ProductSelectedState.women,
      ProductSelectedState.electric,
      ProductSelectedState.watch,
    ]});

  MokaState copyWith({
    int? currentIndexNavigation,
    itemSelected,
    int? currentIndexItem,
  }) {
    return MokaState(
      currentIndexNavigation:
      currentIndexNavigation ?? this.currentIndexNavigation,
      itemSelected: itemSelected ?? this.itemSelected,
      currentIndexItem: currentIndexItem ?? this.currentIndexItem,
    );
  }

  @override
  List<Object?> get props =>
      [
        currentIndexNavigation,
        currentIndexItem,
        menuRefresh,
        compare1,
        screens,
        itemSelected,
      ];
}
