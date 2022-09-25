part of 'moka_bloc.dart';

class MokaState extends Equatable {
  final int? currentIndexNavigation;
  final int? currentIndexItem;
  final int? menuRefresh;
  final List<ProductSelectedState>? compare1;
  final List<Widget>? screens;
  final ProductSelectedState? itemSelected;

  final List<ItemDetails> electronicsProduct;
  final List<ItemDetails> supermarketProduct;
  final List<ItemDetails> menProduct;
  final List<ItemDetails> womenProduct;
  final List<ItemDetails> watchesProduct;
  final List<ItemDetails> currentProduct;

  final RequestState electronicsProductState;
  final RequestState currentProductState;
  final RequestState supermarketProductState;
  final RequestState menProductState;
  final RequestState womenProductState;
  final RequestState watchesProductState;

  const MokaState({
    this.electronicsProduct = const [],
    this.currentProduct = const [],
    this.supermarketProduct = const [],
    this.menProduct = const [],
    this.womenProduct = const [],
    this.watchesProduct = const [],
    this.electronicsProductState = RequestState.loading,
    this.currentProductState = RequestState.loading,
    this.supermarketProductState = RequestState.loading,
    this.menProductState = RequestState.loading,
    this.womenProductState = RequestState.loading,
    this.watchesProductState = RequestState.loading,
    this.currentIndexItem = 0,
    this.currentIndexNavigation = 0,
    this.menuRefresh = 0,
    this.screens = const [
      HomeScreen(),
      FavoritesScreen(),
      CartsScreen(),
      SettingsScreen()
    ],
    this.itemSelected = ProductSelectedState.men,
    this.compare1 = const [
      ProductSelectedState.electric,
      ProductSelectedState.men,
      ProductSelectedState.women,
      ProductSelectedState.watch,
      ProductSelectedState.supermarket
    ],
  });

  MokaState copyWith({
    List<ItemDetails>? electronicsProduct,
    List<ItemDetails>? currentProduct,
    List<ItemDetails>? supermarketProduct,
    List<ItemDetails>? menProduct,
    List<ItemDetails>? womenProduct,
    List<ItemDetails>? watchesProduct,
    RequestState? electronicsProductState,
    RequestState? currentProductState,
    RequestState? supermarketProductState,
    RequestState? menProductState,
    RequestState? womenProductState,
    RequestState? watchesProductState,
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
      supermarketProduct: supermarketProduct ?? this.supermarketProduct,
      supermarketProductState:
          supermarketProductState ?? this.supermarketProductState,
      menProduct: menProduct ?? this.menProduct,
      menProductState: menProductState ?? this.menProductState,
      womenProduct: womenProduct ?? this.womenProduct,
      womenProductState: womenProductState ?? this.womenProductState,
      watchesProduct: watchesProduct ?? this.watchesProduct,
      watchesProductState: watchesProductState ?? this.watchesProductState,
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
        supermarketProduct,
        menProduct,
        womenProduct,
        watchesProduct,
        currentProduct,
        electronicsProductState,
        currentProductState,
        supermarketProductState,
        menProductState,
        womenProductState,
        watchesProductState,
      ];
}
