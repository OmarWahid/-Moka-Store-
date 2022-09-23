part of 'moka_bloc.dart';

class MokaState extends Equatable {
  final int? currentIndexNavigation;
  final int? currentIndexItem;
  final int? menuRefresh;

  final List<ProductSelectedState>? compare1;
  final List<Widget>? screens;
  final ProductSelectedState? itemSelected;
  final List<ItemDetails> electronicsProduct;
  final List<ItemDetails> currentProduct;
  final RequestState electronicsProductState;
  final RequestState currentProductState;

  const MokaState(
      {this.electronicsProduct = const [],
      this.currentProduct = const [] ,
      this.electronicsProductState = RequestState.loading,
      this.currentProductState = RequestState.loading,
      this.currentIndexItem = 0,
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
        ProductSelectedState.electric,
        ProductSelectedState.men,
        ProductSelectedState.women,

        ProductSelectedState.watch,
        ProductSelectedState.supermarket
      ]});

  MokaState copyWith({
    List<ItemDetails>? electronicsProduct,
    List<ItemDetails>? currentProduct,
    RequestState? electronicsProductState,
    RequestState? currentProductState,
    int? currentIndexNavigation,
    itemSelected,
    int? currentIndexItem,
  }) {
    return MokaState(
      currentIndexNavigation:
          currentIndexNavigation ?? this.currentIndexNavigation,
      itemSelected: itemSelected ?? this.itemSelected,
      currentIndexItem: currentIndexItem ?? this.currentIndexItem,
      electronicsProduct: electronicsProduct ?? this.electronicsProduct,
      electronicsProductState:
          electronicsProductState ?? this.electronicsProductState,
      currentProduct: currentProduct ?? this.currentProduct,
      currentProductState: currentProductState ?? this.currentProductState,
    );
  }

  @override
  List<Object?> get props => [
        currentIndexNavigation,
        currentIndexItem,
        menuRefresh,
        compare1,
        screens,
        itemSelected,
        electronicsProduct,
        electronicsProductState,
        currentProduct,
        currentProductState,
      ];
}
