import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moka_store/core/utils/constants_manager.dart';
import 'package:moka_store/core/utils/font_manager.dart';
import 'package:moka_store/core/utils/strings_manager.dart';
import 'package:moka_store/core/utils/values_manager.dart';
import 'package:readmore/readmore.dart';
import '../../../../config/shared/component.dart';
import '../../../../core/utils/color_manager.dart';

class ItemDetailsScreen extends StatelessWidget {
  final item;

  const ItemDetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColor.white,
            child: Hero(
              tag: item.image,
              child: CachedNetworkImage(
                imageUrl: '${item.image}',
                width: double.infinity,
                height: size.height * 0.4215,
                //   fit: BoxFit.fill,
                placeholder: (context, url) => Container(
                  color: AppColor.white,
                  width: double.infinity,
                  height: size.height * 0.46,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppPadding.p26),
            child: Material(
              elevation: AppConstants.noElevation,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: AppSize.s20,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      size: AppSize.s24,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s35),
                    topRight: Radius.circular(AppSize.s35)),
                color: Colors.transparent,
              ),
              height: size.height * 0.65,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(AppSize.s35),
                            topRight: Radius.circular(AppSize.s35)),
                      ),
                      height: size.height * 0.64 - AppSize.s30,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p20),
                        child: SingleChildScrollView(
                          child: FadeInUp(
                            from: AppConstants.fadeInFrom,
                            duration: const Duration(
                                milliseconds: AppConstants.fadeDelay),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: AppSize.s30,
                                ),
                                Text('${item.title}',
                                    maxLines: AppConstants.cI1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(fontSize: AppFontSize.s24)),
                                const SizedBox(
                                  height: AppSize.s10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RatingBar.builder(
                                          itemSize: AppSize.s30,
                                          initialRating:
                                              double.parse(item.rate),
                                          ignoreGestures: true,
                                          minRating: AppConstants.cD1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: AppConstants.cI5,
                                          itemPadding:
                                              const EdgeInsetsDirectional.only(
                                            end: AppPadding.p1,
                                          ),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: AppColor.primary,
                                            size: AppSize.s10,
                                          ),
                                          onRatingUpdate: (rating) {
                                            // print(rating);
                                          },
                                        ),
                                        const SizedBox(
                                          height: AppSize.s4,
                                        ),
                                        Text('${item.rate} Ratings',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: AppColor.primary,
                                                  fontFamily: '',
                                                ))
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Text('${AppStrings.poundLE} ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .copyWith(
                                                        fontSize:
                                                            AppFontSize.s30,
                                                        fontFamily: '')),
                                            if (item.discount != "0")
                                              (item.discount == "12,000")
                                                  ? Text('12K ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                            fontSize:
                                                                AppFontSize.s30,
                                                            fontFamily: '',
                                                          ))
                                                  : Text('${item.discount} ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                            fontSize:
                                                                AppFontSize.s30,
                                                            fontFamily: '',
                                                          )),
                                            Text('${item.price}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .copyWith(
                                                        fontSize: item
                                                                    .discount !=
                                                                "0"
                                                            ? AppFontSize.s15
                                                            : AppFontSize.s30,
                                                        fontFamily: '',
                                                        decoration:
                                                            item.discount != "0"
                                                                ? TextDecoration
                                                                    .lineThrough
                                                                : TextDecoration
                                                                    .none,
                                                        decorationColor:
                                                            AppColor.primary)),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: AppSize.s2,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.only(
                                                  start: AppPadding.p24),
                                          child: Text(AppStrings.perPiece,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                    fontFamily: '',
                                                  )),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: AppSize.s16,
                                ),
                                Text(
                                  AppStrings.description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        fontSize: AppFontSize.s20,
                                      ),
                                ),
                                const SizedBox(
                                  height: AppSize.s10,
                                ),
                                ReadMoreText(
                                  '${item.description}',
                                  trimLines: 3,
                                  colorClickableText: AppColor.primary,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: AppStrings.showMore,
                                  trimExpandedText: AppStrings.showLess,
                                  moreStyle: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        fontSize: AppFontSize.s14,
                                        color: AppColor.primary,
                                      ),
                                  lessStyle: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        fontSize: AppFontSize.s14,
                                        color: AppColor.primary,
                                      ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: AppFontSize.s15),
                                ),
                                const SizedBox(
                                  height: AppSize.s12,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppStrings.numberPortions,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                              fontSize: AppFontSize.s19,
                                            ),
                                      ),
                                      const SizedBox(
                                        width: AppSize.s16,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Material(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppSize.s30),
                                                  elevation: AppConstants.cD10,
                                                  child: defaultButton(
                                                      function: () {
                                                        // cubit
                                                        //     .changeNumberOfPortions(
                                                        //     '-');
                                                      },
                                                      text: '-',
                                                      width: AppSize.s20,
                                                      radius: AppSize.s30,
                                                      height: AppSize.s30),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: AppSize.s5,
                                              ),
                                              Expanded(
                                                  child: OutlinedButton(
                                                onPressed: () {},
                                                style: const ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                      AppColor
                                                          .scaffoldBackGround,
                                                    ),
                                                    side:
                                                        MaterialStatePropertyAll(
                                                            BorderSide(
                                                      color: AppColor.primary,
                                                    )),
                                                    shape:
                                                        MaterialStatePropertyAll(
                                                      CircleBorder(
                                                        side: BorderSide(),
                                                      ),
                                                    ),
                                                    padding:
                                                        MaterialStatePropertyAll(
                                                            EdgeInsets.all(
                                                      AppPadding.p8,
                                                    ))),
                                                child: FittedBox(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      bottom: AppPadding.p1,
                                                    ),
                                                    child: Text(
                                                      '8',
                                                      //  '${cubit.numberOfPortions}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium!
                                                          .copyWith(
                                                            color: AppColor
                                                                .primary,
                                                            fontFamily: '',
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                              const SizedBox(
                                                width: AppSize.s5,
                                              ),
                                              Expanded(
                                                child: Material(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppSize.s20),
                                                  elevation: AppConstants.cD10,
                                                  child: defaultButton(
                                                      function: () {
                                                        // cubit
                                                        //     .changeNumberOfPortions(
                                                        //     '+');
                                                      },
                                                      text: '+',
                                                      width: AppSize.s20,
                                                      radius: AppSize.s20,
                                                      height: AppSize.s30),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ]),
                                const SizedBox(
                                  height: AppSize.s16,
                                ),
                                buildMoreItem(
                                  context: context,
                                  //cubit: cubit ,
                                ),
                                const SizedBox(
                                  height: AppSize.s35,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        end: AppPadding.p10, top: AppPadding.p4),
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Material(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(AppSize.s20),
                            bottomStart: Radius.circular(AppSize.s100),
                            topEnd: Radius.circular(AppSize.s100),
                            bottomEnd: Radius.circular(AppSize.s20)),
                        elevation: AppConstants.cD20,
                        child: InkWell(
                          // onTap: () => cubit.changeFavoriteColor(item.id),
                          child: Container(
                            width: AppSize.s70,
                            height: AppSize.s70,
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            child: const Icon(
                              Icons.favorite,
                              color: AppColor.primary,
                              size: AppSize.s30,
                              //  cubit.fav ? defaultColor : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMoreItem({
    required BuildContext context,
    // required ItemDetailsScreenCubit cubit,
  }) {
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
              end: AppPadding.p20, start: AppPadding.p35),
          child: Material(
            elevation: AppSize.s30,
            borderRadius: BorderRadius.circular(AppSize.s30),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p60),
                child: Column(
                  children: [
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Text(
                      AppStrings.totalPrice,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColor.primary),
                    ),
                    const SizedBox(
                      height: AppSize.s12,
                    ),
                    // Text('${AppStrings.poundLE} ${cubit.totalPrice}',
                    Text('${AppStrings.poundLE} 300',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontFamily: '')),
                    const SizedBox(
                      height: AppSize.s10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppPadding.p14),
                      child: Container(
                        width: double.infinity,
                        height: AppSize.s40,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0, color: AppColor.primary),
                          borderRadius: BorderRadius.circular(
                            AppSize.s30,
                          ),
                          color: AppColor.primary,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            // cubit.addToCart(
                            //     id: item.id,
                            //     itemCount: cubit.numberOfPortions,
                            //     totalPrice: cubit.totalPrice);
                            //  showToast(msg: 'Added Successfully');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.add_shopping_cart,
                                size: AppSize.s20,
                                color: AppColor.white,
                              ),
                              SizedBox(
                                width: AppSize.s20,
                              ),
                              Text(
                                AppStrings.addCart,
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: AppFontSize.s16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Material(
          borderRadius: BorderRadius.circular(AppSize.s50),
          color: Theme.of(context).scaffoldBackgroundColor,
          elevation: AppSize.s14,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            width: AppSize.s50,
            height: AppSize.s50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s50),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: AppColor.primary,
                size: AppSize.s24,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}

