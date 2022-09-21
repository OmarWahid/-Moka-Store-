import 'package:flutter/material.dart';
import 'package:moka_store/core/utils/assets_manager.dart';
import 'package:moka_store/core/utils/strings_manager.dart';
import '../../components/basic_no_found_component.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BasicNoFoundScreen(
      image: ImageAssets.noFavorites,
      name: AppStrings.noFavorites,
    );
  }
}
