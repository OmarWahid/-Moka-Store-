import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moka_store/core/utils/constants_manager.dart';
import 'package:moka_store/core/utils/font_manager.dart';
import 'package:moka_store/core/utils/strings_manager.dart';
import 'package:moka_store/core/utils/values_manager.dart';
import 'package:readmore/readmore.dart';
import '../../../../core/utils/color_manager.dart';

class ItemDetailsScreen extends StatelessWidget {
  // final ItemModel item;

  const ItemDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // return BlocProvider(
    //   create: (context) => ItemDetailsScreenCubit()
    //     ..setPrices(item.discount != 0 ? item.discount : item.price)
    //     ..setFav(item.id),
    //   child: BlocConsumer<ItemDetailsScreenCubit, ItemDetailsScreenStates>(
    //     listener: (context, state) {},
    //     builder: (context, state) {
    //       var cubit = ItemDetailsScreenCubit.get(context);
    //       return Scaffold(
    //         body: Stack(
    //           children: [
    //             Image(
    //               image: NetworkImage('${item.imagepath}'),
    //               width: double.infinity,
    //               height: size.height * 0.48,
    //               fit: BoxFit.fill,
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(top: 20.0),
    //               child: Material(
    //                 elevation: 20,
    //                 color: Colors.transparent,
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     IconButton(
    //                       onPressed: () {
    //                         Navigator.pop(context);
    //                       },
    //                       icon: Icon(Icons.arrow_back_ios_new,
    //                           size: 20,
    //                           color: Theme.of(context).scaffoldBackgroundColor),
    //                     ),
    //                     IconButton(
    //                       icon: Icon(
    //                         Icons.shopping_cart,
    //                         color: Theme.of(context).scaffoldBackgroundColor,
    //                         size: 25,
    //                       ),
    //                       onPressed: () {},
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             Align(
    //               alignment: Alignment.bottomCenter,
    //               child: Container(
    //                 clipBehavior: Clip.antiAliasWithSaveLayer,
    //                 decoration: const BoxDecoration(
    //                     borderRadius: BorderRadius.only(
    //                         topLeft: Radius.circular(35),
    //                         topRight: Radius.circular(35)),
    //                     color: Colors.transparent),
    //                 height: size.height * 0.6,
    //                 child: Stack(
    //                   alignment: Alignment.bottomCenter,
    //                   children: [
    //                     Container(
    //                         clipBehavior: Clip.antiAliasWithSaveLayer,
    //                         decoration: BoxDecoration(
    //                           color: Theme.of(context).scaffoldBackgroundColor,
    //                           borderRadius: const BorderRadius.only(
    //                               topLeft: Radius.circular(35),
    //                               topRight: Radius.circular(35)),
    //                         ),
    //                         height: size.height * 0.6 - 30,
    //                         width: double.infinity,
    //                         child: Padding(
    //                           padding:
    //                               const EdgeInsets.symmetric(horizontal: 20.0),
    //                           child: SingleChildScrollView(
    //                             child: Column(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 const SizedBox(
    //                                   height: 45,
    //                                 ),
    //                                 Text('${item.title}',
    //                                     maxLines: 1,
    //                                     style: Theme.of(context)
    //                                         .textTheme
    //                                         .headline1!
    //                                         .copyWith(fontSize: 22)),
    //                                 const SizedBox(
    //                                   height: 10,
    //                                 ),
    //                                 Row(
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.spaceBetween,
    //                                   children: [
    //                                     Column(
    //                                       crossAxisAlignment:
    //                                           CrossAxisAlignment.start,
    //                                       children: [
    //                                         RatingBar.builder(
    //                                           itemSize: 30,
    //                                           initialRating:
    //                                               double.parse(item.rate),
    //                                           ignoreGestures: true,
    //                                           minRating: 1,
    //                                           direction: Axis.horizontal,
    //                                           allowHalfRating: true,
    //                                           itemCount: 5,
    //                                           itemPadding:
    //                                               const EdgeInsetsDirectional
    //                                                   .only(end: 1.0),
    //                                           itemBuilder: (context, _) =>
    //                                               const Icon(
    //                                             Icons.star,
    //                                             color: AppColor.primary,
    //                                             size: 10,
    //                                           ),
    //                                           onRatingUpdate: (rating) {
    //                                             print(rating);
    //                                           },
    //                                         ),
    //                                         const SizedBox(
    //                                           height: 5,
    //                                         ),
    //                                         Text('${item.rate} Ratings',
    //                                             style: Theme.of(context)
    //                                                 .textTheme
    //                                                 .bodyText1!
    //                                                 .copyWith(
    //                                                     color:
    //                                                         AppColor.primary))
    //                                       ],
    //                                     ),
    //                                     Column(
    //                                       crossAxisAlignment:
    //                                           CrossAxisAlignment.start,
    //                                       children: [
    //                                         Row(
    //                                           children: [
    //                                             Text('L.E ',
    //                                                 style: Theme.of(context)
    //                                                     .textTheme
    //                                                     .headline2!
    //                                                     .copyWith(
    //                                                         fontSize: 31)),
    //                                             if (item.discount != 0)
    //                                               Text('${item.discount} ',
    //                                                   style: Theme.of(context)
    //                                                       .textTheme
    //                                                       .headline2!
    //                                                       .copyWith(
    //                                                           fontSize: 31)),
    //                                             Text('${item.price}',
    //                                                 style: Theme.of(context)
    //                                                     .textTheme
    //                                                     .headline2!
    //                                                     .copyWith(
    //                                                         fontSize:
    //                                                             item.discount !=
    //                                                                     0
    //                                                                 ? 15
    //                                                                 : 31,
    //                                                         decoration: item
    //                                                                     .discount !=
    //                                                                 0
    //                                                             ? TextDecoration
    //                                                                 .lineThrough
    //                                                             : TextDecoration
    //                                                                 .none,
    //                                                         decorationColor:
    //                                                             AppColor
    //                                                                 .primary)),
    //                                           ],
    //                                         ),
    //                                         const SizedBox(
    //                                           height: 5,
    //                                         ),
    //                                         Padding(
    //                                           padding:
    //                                               const EdgeInsetsDirectional
    //                                                   .only(start: 25.0),
    //                                           child: Text('/ per Portion',
    //                                               style: Theme.of(context)
    //                                                   .textTheme
    //                                                   .bodyText1!),
    //                                         )
    //                                       ],
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 const SizedBox(
    //                                   height: 20,
    //                                 ),
    //                                 Text('Description',
    //                                     style: Theme.of(context)
    //                                         .textTheme
    //                                         .headline2),
    //                                 const SizedBox(
    //                                   height: 10,
    //                                 ),
    //                                 Text('${item.description}',
    //                                     maxLines: 3,
    //                                     style: Theme.of(context)
    //                                         .textTheme
    //                                         .bodyText1),
    //                                 const SizedBox(
    //                                   height: 20,
    //                                 ),
    //                                 Row(
    //                                     mainAxisAlignment:
    //                                         MainAxisAlignment.spaceBetween,
    //                                     children: [
    //                                       Text('Number of Portions',
    //                                           style: Theme.of(context)
    //                                               .textTheme
    //                                               .headline2),
    //                                       const SizedBox(
    //                                         width: 30,
    //                                       ),
    //                                       Expanded(
    //                                         child: SizedBox(
    //                                           width: double.infinity,
    //                                           child: Row(
    //                                             children: [
    //                                               Expanded(
    //                                                 child: Material(
    //                                                   borderRadius:
    //                                                       BorderRadius.circular(
    //                                                           20),
    //                                                   elevation: 10,
    //                                                   child: defaultButton(
    //                                                       function: () {
    //                                                         cubit
    //                                                             .changeNumberOfPortions(
    //                                                                 '-');
    //                                                       },
    //                                                       text: '-',
    //                                                       width: 20,
    //                                                       radius: 20,
    //                                                       height: 30),
    //                                                 ),
    //                                               ),
    //                                               const SizedBox(
    //                                                 width: 5,
    //                                               ),
    //                                               Expanded(
    //                                                 child: defaultButton(
    //                                                     function: () {},
    //                                                     text:
    //                                                         '${cubit.numberOfPortions}',
    //                                                     width: 20,
    //                                                     backgroundColor: Theme
    //                                                             .of(context)
    //                                                         .scaffoldBackgroundColor,
    //                                                     fontColor: AppColor.primary,
    //                                                     borderWidth: 1,
    //                                                     radius: 20,
    //                                                     height: 30),
    //                                               ),
    //                                               const SizedBox(
    //                                                 width: 5,
    //                                               ),
    //                                               Expanded(
    //                                                 child: Material(
    //                                                   borderRadius:
    //                                                       BorderRadius.circular(
    //                                                           20),
    //                                                   elevation: 10,
    //                                                   child: defaultButton(
    //                                                       function: () {
    //                                                         cubit
    //                                                             .changeNumberOfPortions(
    //                                                                 '+');
    //                                                       },
    //                                                       text: '+',
    //                                                       radius: 20,
    //                                                       width: 20,
    //                                                       height: 30),
    //                                                 ),
    //                                               ),
    //                                             ],
    //                                           ),
    //                                         ),
    //                                       )
    //                                     ]),
    //                                 const SizedBox(
    //                                   height: 20,
    //                                 ),
    //                                 buildMoreItem(
    //                                     context: context,
    //                                     title: 'title',
    //                                     cubit: cubit),
    //                                 const SizedBox(
    //                                   height: 50,
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                         )),
    //                     Padding(
    //                       padding: const EdgeInsets.only(bottom: 8.0),
    //                       child: defaultButton(
    //                           function: () {
    //                             cubit.addToCart(
    //                                 id: item.id,
    //                                 itemCount: cubit.numberOfPortions,
    //                                 totalPrice: cubit.totalPrice);
    //                            // showToast(msg: 'Added Successfully');
    //                           },
    //                           isUpperCase: false,
    //                           prefix:Icons.add_shopping_cart,
    //                           text: 'Add to Cart',
    //                           height: 40,
    //                           radius: 30),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            //   imageUrl: NetworkImage('${item.imagepath}'),
            imageUrl:
                'https://t4.ftcdn.net/jpg/03/52/07/97/240_F_352079780_GqPoua81UNGsJjykTVx7wTnkv0Yi73JE.jpg',
            width: double.infinity,
            height: size.height * 0.46,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: AppColor.primary,
              width: double.infinity,
              height: size.height * 0.46,
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColor.white,
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
                                //   Text('${item.title}',
                                Text('Electoronics shirt',
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
                                          initialRating: 3.5,
                                          //   double.parse(item.rate),
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
                                        //    Text('${item.rate} Ratings',
                                        Text('3.5 Ratings',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    color: AppColor.primary,
                                                    fontFamily: ''))
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            // if (item.discount != 0)
                                            //   Text('${item.discount} ',
                                            //       style: Theme.of(context)
                                            //           .textTheme
                                            //           .headlineLarge!
                                            //           .copyWith(
                                            //           fontSize: AppFontSize.s30,
                                            //            fontFamily: '',
                                            //           )),
                                            // Text('${item.price}',
                                            Text('300',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .copyWith(
                                                        fontSize:
                                                            // item.discount !=
                                                            //     0
                                                            //     ? 15
                                                            //     :
                                                            AppFontSize.s30,
                                                        fontFamily: '',
                                                        decoration:
                                                            // item
                                                            //     .discount !=
                                                            //     0
                                                            //     ? TextDecoration
                                                            //     .lineThrough
                                                            //     :
                                                            TextDecoration.none,
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
                                  //   Text('${item.description}',
                                  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase',
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
                                                                AppPadding
                                                                    .p8))),
                                                child: FittedBox(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom:
                                                                AppPadding.p1),
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
                        end: AppPadding.p10, top: AppPadding.p8),
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

Widget defaultButton({
  double width = double.infinity,
  double height = 60,
  Color backgroundColor = AppColor.primary,
  Color borderColor = AppColor.primary,
  Color fontColor = Colors.white,
  bool isUpperCase = true,
  //String fontFamily = 'Metropolis-SemiBold',
  double radius = 3.0,
  double borderWidth = 0,
  double fontSize = 16.0,
  required Function function,
  required String text,
  IconData? prefix,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(width: borderWidth, color: borderColor),
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: backgroundColor,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefix != null)
              Icon(
                prefix,
                size: 20,
                color: const Color(0xFFffffff),
              ),
            if (prefix != null)
              const SizedBox(
                width: 20,
              ),
            Text(
              isUpperCase ? text.toUpperCase() : text,
              style: TextStyle(
                color: fontColor,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
