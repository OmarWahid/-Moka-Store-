import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moka_store/core/utils/font_manager.dart';
import 'package:moka_store/core/utils/strings_manager.dart';
import 'package:moka_store/core/utils/values_manager.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/constants_manager.dart';
import '../../components/basic_no_found_component.dart';
import '../../controller/moka_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MokaBloc, MokaState>(
      buildWhen: (previous, current) =>
          previous.favoritesItems != current.favoritesItems,
      builder: (context, state) {
        print('CartsScreen');
        var itemFavorite = state.favoritesItems;
        if (state.favoritesItems!.isEmpty) {
          return const BasicNoFoundScreen(
            image: ImageAssets.noFavorites,
            name: AppStrings.noFavorites,
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Column(
            children: [
              const SizedBox(height: AppSize.s8),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: AppSize.s170,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p12,
                        vertical: AppPadding.p10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s16),
                        color: AppColor.white,
                        border: Border.all(color: AppColor.lightGrey),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(AppSize.s16),
                            child: CachedNetworkImage(
                              imageUrl: itemFavorite[index]['image'],
                              height: AppSize.s150,
                              width: AppSize.s150,
                              errorWidget: (context, url, error) => Image.asset(
                                ImageAssets.onboardingLogo3,
                                height: AppSize.s150,
                                width: AppSize.s150,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSize.s16),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  itemFavorite[index]['name'],
                                  style: Theme.of(context).textTheme.bodySmall,
                                  maxLines: AppConstants.cI2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: AppSize.s10,
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      '${AppStrings.poundLE} ${itemFavorite[index]['price']}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontFamily: '',
                                            color: AppColor.primary,
                                          ),
                                    ),
                                    const SizedBox(
                                      width: AppSize.s4,
                                    ),
                                    // do per product
                                    Text(
                                      AppStrings.perPiece,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontFamily: '',
                                            color: AppColor.lightGrey,
                                            fontSize: AppFontSize.s11,
                                          ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: AppSize.s10,
                                ),
                                // make counter
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RatingBar.builder(
                                      itemSize: AppSize.s20,
                                      initialRating: double.parse(
                                          itemFavorite[index]['rate']),
                                      ignoreGestures: true,
                                      minRating: AppConstants.cD1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: AppConstants.cI5,
                                      itemPadding:
                                          const EdgeInsetsDirectional.only(
                                        end: AppPadding.p1,
                                      ),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: AppColor.primary,
                                        size: AppSize.s10,
                                      ),
                                      onRatingUpdate: (rating) {
                                        // print(rating);
                                      },
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        MokaBloc.get(context).add(
                                          DeleteFromFavoriteDatabaseEvent(
                                            itemFavorite[index]['id'],
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: AppSize.s30,
                                        width: AppSize.s30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(AppSize.s8),
                                          color: AppColor.primary,
                                        ),
                                        child: const Icon(
                                          Icons.delete_outline,
                                          color: AppColor.white,
                                          size: AppSize.s20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: AppSize.s18);
                  },
                  itemCount: itemFavorite!.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
