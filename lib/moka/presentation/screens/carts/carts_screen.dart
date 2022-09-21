import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moka_store/core/utils/strings_manager.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../components/basic_no_found_component.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BasicNoFoundScreen(
      image: ImageAssets.noCarts,
      name: AppStrings.noCarts,
    );
  }
}
