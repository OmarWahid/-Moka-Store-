import 'package:flutter/material.dart';
import 'package:moka_store/core/utils/strings_manager.dart';
import 'package:moka_store/core/utils/values_manager.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/icons_manager.dart';
import '../../../../core/utils/routes_manager.dart';

class CategoryItemsScreen extends StatelessWidget {
  const CategoryItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: Column(
          children: [
            const SizedBox(
              height: AppSize.s60,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.searchRoute);
                    },
                    child: Container(
                      height: AppSize.s50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p12,
                        vertical: AppPadding.p12,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          color: AppColor.scaffoldBackGround,
                          border: Border.all(
                            color: AppColor.grey,
                          )),
                      child: Row(
                        children: const [
                          Icon(IconBroken.Search, color: AppColor.grey),
                          SizedBox(
                            width: AppSize.s12,
                          ),
                          Text(AppStrings.search,
                              style: TextStyle(color: AppColor.grey)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: AppSize.s12,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: AppSize.s50,
                    width: AppSize.s50,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(AppSize.s8),
                    ),
                    child: const Icon(
                      IconBroken.Filter,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
