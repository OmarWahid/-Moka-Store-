import 'package:flutter/material.dart';
import 'package:moka_store/core/utils/constants_manager.dart';
import 'package:moka_store/moka/presentation/screens/carts/general_cart_screen.dart';
import 'package:moka_store/moka/presentation/screens/category_see_more/category_details_screen.dart';
import 'package:moka_store/moka/presentation/screens/category_see_more/catogry_items_screen.dart';
import 'package:moka_store/moka/presentation/screens/item_details/item_details_screen.dart';
import 'package:moka_store/moka/presentation/screens/search/search_screen.dart';
import '../../moka/presentation/screens/main/main_screen.dart';
import '../../moka/presentation/screens/onboarding/onboarding_screen.dart';
import '../../moka/presentation/screens/payment/cash_screen.dart';
import '../../moka/presentation/screens/payment/payment_toggle_screen.dart';
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
  static const String generalCartRoute = "/cart";
  static const String toggleRoute = "/toggle";
  static const String cashRoute = "/cash";
  static const String visaRoute = "/visa";
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
        List<dynamic>? args = settings.arguments as List?;
        return MaterialPageRoute(
            builder: (_) => CategoryItemsScreen(
                  item: args![AppConstants.cI0],
                  appbarTitle: args[AppConstants.cI1],
                ));

      case Routes.itemDetailsRoute:
        return MaterialPageRoute(
            builder: (_) => ItemDetailsScreen(
                  item: settings.arguments,
                ));

      case Routes.searchRoute:
        return MaterialPageRoute(
            builder: (_) => SearchScreen(
                  listSearch: settings.arguments,
                ));

      case Routes.generalCartRoute:
        return MaterialPageRoute(builder: (_) => const GeneralCartScreen());

      case Routes.toggleRoute:
        return MaterialPageRoute(builder: (_) => const ToggleScreen());

      case Routes.cashRoute:
        return MaterialPageRoute(builder: (_) => const CashScreen());

        // case Routes.visaRoute:
        // return MaterialPageRoute(builder: (_) => const VisaScreen());

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
