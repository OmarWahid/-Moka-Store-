import 'package:flutter/material.dart';
import 'package:moka_store/moka/presentation/screens/home/product_part.dart';

import '../../../../config/shared/constant.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/icons_manager.dart';
import '../../../../core/utils/routes_manager.dart';
import '../../../../core/utils/strings_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../controller/moka_bloc.dart';
import 'category_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: AppSize.s18,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.searchRoute,
                        arguments: allProductConstant,
                      );
                    },
                    child: Container(
                      height: AppSize.s50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p12,
                        vertical: AppPadding.p12,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          color: MokaBloc.get(context).state.isDark
                              ? AppColor.scaffoldDarkBackGround
                              : AppColor.scaffoldLightBackGround,
                          border: Border.all(
                            color: AppColor.grey,
                          )),
                      child: Row(
                        children: [
                          const Icon(IconBroken.Search, color: AppColor.grey),
                          const SizedBox(
                            width: AppSize.s12,
                          ),
                          Text(AppStrings.search,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: AppColor.grey)),
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
                )
              ],
            ),
            const SizedBox(
              height: AppSize.s18,
            ),
            Row(
              children: [
                Text(
                  AppStrings.categories,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.categorySeeMoreRoute);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: AppPadding.p8),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.seeMore,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          width: AppSize.s2,
                        ),
                        const Icon(
                          IconBroken.Arrow___Right_2,
                          color: AppColor.primary,
                          size: AppSize.s18,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            const CarouselSliderItem(),
            const SizedBox(
              height: AppSize.s16,
            ),
            Row(
              children: [
                Text(
                  AppStrings.products,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.categoryItemsRoute,
                        arguments: [
                          allProductConstant,
                          AppStrings.allProducts
                        ]);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: AppPadding.p8),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.seeMore,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          width: AppSize.s2,
                        ),
                        const Icon(
                          IconBroken.Arrow___Right_2,
                          color: AppColor.primary,
                          size: AppSize.s18,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s14,
            ),
            const ProductPart(),
          ],
        ),
      ),
    );
  }
}
