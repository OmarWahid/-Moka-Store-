import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moka_store/core/utils/constants_manager.dart';
import 'package:moka_store/core/utils/font_manager.dart';
import 'package:moka_store/core/utils/strings_manager.dart';
import 'package:moka_store/core/utils/values_manager.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/enums_manager.dart';
import '../../../../core/utils/routes_manager.dart';
import '../../components/basic_no_found_component.dart';
import '../../controller/moka_bloc.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MokaBloc, MokaState>(
      buildWhen: (previous, current) =>
          previous.cartItems != current.cartItems ||
          previous.cartState != current.cartState,
      listener: (context, state) {
        if (state.cartState == RequestState.loaded) {
          Navigator.pushNamed(context, Routes.toggleRoute);
          state.copyWith(cartState: RequestState.error);
        }
      },
      builder: (context, state) {
        print('CartsScreen');
        var itemCard = state.cartItems;
        if (state.cartItems!.isEmpty) {
          return const BasicNoFoundScreen(
            image: ImageAssets.noCarts,
            name: AppStrings.noCarts,
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
                              imageUrl: itemCard[index]['image'],
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
                                  itemCard[index]['name'],
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
                                      '${AppStrings.poundLE} ${itemCard[index]['price']}',
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
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (itemCard[index]['quantity'] >
                                                1) {
                                              MokaBloc.get(context).add(
                                                  UpdateFromCartDatabaseEvent(
                                                itemCard[index]['id'],
                                                itemCard[index]['quantity'] - 1,
                                              ));
                                            }
                                          },
                                          child: Container(
                                            height: AppSize.s24,
                                            width: AppSize.s24,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppSize.s8),
                                              color: AppColor.lightBlue,
                                            ),
                                            child: const Icon(
                                              Icons.remove,
                                              color: AppColor.white,
                                              size: AppSize.s18,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: AppSize.s10,
                                        ),
                                        Text(
                                          itemCard[index]['quantity']
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: AppColor.black,
                                                fontSize: AppSize.s20,
                                                fontFamily: '',
                                              ),
                                        ),
                                        const SizedBox(
                                          width: AppSize.s10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            MokaBloc.get(context).add(
                                                UpdateFromCartDatabaseEvent(
                                              itemCard[index]['id'],
                                              itemCard[index]['quantity'] + 1,
                                            ));
                                          },
                                          child: Container(
                                            height: AppSize.s24,
                                            width: AppSize.s24,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppSize.s8),
                                              color: AppColor.lightBlue,
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              color: AppColor.white,
                                              size: AppSize.s18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        MokaBloc.get(context).add(
                                          DeleteFromCartDatabaseEvent(
                                            itemCard[index]['id'],
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: AppSize.s30,
                                        width: AppSize.s30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(AppSize.s8),
                                          color: AppColor.lightBlue,
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
                  itemCount: itemCard!.length,
                ),
              ),
              const SizedBox(height: AppSize.s16),
              Row(
                children: [
                  Text(
                    '${itemCard.length} ${AppStrings.items}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColor.lightGrey,
                          fontSize: AppSize.s16,
                          fontFamily: '',
                        ),
                  ),
                  const Spacer(),
                  Text(
                    '${AppStrings.poundLE} ${state.totalPrice}',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: '',
                          fontSize: AppSize.s20,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s16),
              (state.cartState == RequestState.loading)
                  ? SizedBox(
                      height: AppSize.s60,
                      width: double.infinity,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primary,
                        ),
                      ),
                    )
                  : Container(
                      height: AppSize.s60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                        color: AppColor.primary,
                      ),
                      child: TextButton(
                        onPressed: () {
                          MokaBloc.get(context).add(getFirstTokenEvent(
                            (state.totalPrice * 100.0).toString(),
                          ));
                        },
                        child: Text(
                          AppStrings.checkout,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: AppColor.white,
                                    fontSize: AppSize.s18,
                                  ),
                        ),
                      ),
                    ),
              const SizedBox(height: AppSize.s8),
            ],
          ),
        );
      },
    );
  }
}
