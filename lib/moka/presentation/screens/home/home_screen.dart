import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moka_store/core/utils/constants_manager.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/enums_manager.dart';
import '../../../../core/utils/font_manager.dart';
import '../../../../core/utils/icons_manager.dart';
import '../../../../core/utils/routes_manager.dart';
import '../../../../core/utils/strings_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../controller/moka_bloc.dart';
import 'category_items.dart';

List<ProductSelectedState> compare2 = [
  ProductSelectedState.men,
  ProductSelectedState.women,
  ProductSelectedState.electric,
  ProductSelectedState.watch
];

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
                      // Navigator.pushNamed(context, Routes.) ;
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
                        children:  [
                          const Icon(IconBroken.Search, color: AppColor.grey),
                          const SizedBox(
                            width: AppSize.s12,
                          ),
                          Text(AppStrings.search,
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: AppColor.grey
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: AppSize.s12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.searchRoute);
                  },
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
                  onTap: () {},
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
            BlocBuilder<MokaBloc, MokaState>(
              buildWhen: (previous, current) => previous.currentIndexItem!=current.currentIndexItem,
              builder: (context, state) {
                var bloc = MokaBloc.get(context);
                log('Home Bloccccccccc');
                return SizedBox(
                  height: AppSize.s50,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          bloc.add(IsSelectedItemProductsEvent(index));

                        },
                        child: AnimatedContainer(
                          width: AppSize.s140,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s30),
                            border: Border.all(
                              color:
                                  (state.compare1![state.currentIndexItem!] ==
                                          compare2[index])
                                      ? AppColor.primary
                                      : AppColor.lightGrey,
                              width: AppSize.s2,
                            ),
                          ),
                          duration: const Duration(milliseconds: AppConstants.containerAnimation),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                listCategory[index].name,
                                style: TextStyle(
                                  color: (state.compare1![
                                              state.currentIndexItem!] ==
                                          compare2[index])
                                      ? AppColor.primary
                                      : AppColor.lightGrey,
                                  fontWeight: AppFontWeight.semiBold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      width: 10,
                    ),
                    itemCount: 4,
                  ),
                );
              },
            ),
            const SizedBox(
              height: AppSize.s14,
            ),
          ],
        ),
      ),
    );
  }
}
