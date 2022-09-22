import 'package:flutter/material.dart';
import 'package:moka_store/moka/presentation/screens/category_see_more/category_details_screen.dart';
import 'package:moka_store/moka/presentation/screens/category_see_more/catogry_items_screen.dart';
import 'package:moka_store/moka/presentation/screens/item_details/item_details_screen.dart';
import 'package:moka_store/moka/presentation/screens/search/search_screen.dart';
import '../../moka/presentation/screens/main/main_screen.dart';
import '../../moka/presentation/screens/onboarding/onboarding_screen.dart';
import '../../moka/presentation/screens/splash/splash_screen.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String mainRoute = "/main";
  static const String categorySeeMoreRoute = "/category";
  static const String categoryItemsRoute = "/categoryItems";
  static const String itemDetailsRoute = "/itemDetails";
  static const String searchRoute = "/search";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainHomeZoom());

      case Routes.categorySeeMoreRoute:
        return MaterialPageRoute(builder: (_) => const CategorySeeMoreScreen());

      case Routes.categoryItemsRoute:
        return MaterialPageRoute(builder: (_) => const CategoryItemsScreen());

      case Routes.itemDetailsRoute:
        return MaterialPageRoute(builder: (_) => ItemDetailsScreen(
          item: settings.arguments,
        ));

      case Routes.searchRoute:
        return MaterialPageRoute(builder: (_) =>  SearchScreen(
          listSearch: settings.arguments,
        ));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
