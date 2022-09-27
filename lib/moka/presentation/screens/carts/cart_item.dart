import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moka_store/core/utils/constants_manager.dart';
import 'package:moka_store/core/utils/font_manager.dart';
import 'package:moka_store/core/utils/strings_manager.dart';
import 'package:moka_store/core/utils/values_manager.dart';
import '../../../../core/utils/color_manager.dart';
import '../../controller/moka_bloc.dart';

class CardItemScreen extends StatelessWidget {
  const CardItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MokaBloc, MokaState>(
      builder: (context, state) {
        print('Build Cart Screen');
        var itemCard = state.cartItems;
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
                            child: Image.network(
                              itemCard[index]['image'],
                              height: AppSize.s150,
                              width: AppSize.s150,
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
                                          onTap: () {},
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
                                              ),
                                        ),
                                        const SizedBox(
                                          width: AppSize.s10,
                                        ),
                                        GestureDetector(
                                          onTap: () {},
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
                                          DeleteFromDatabaseEvent(
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
                    '3 ${AppStrings.items}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColor.lightGrey,
                          fontSize: AppSize.s16,
                          fontFamily: '',
                        ),
                  ),
                  const Spacer(),
                  Text(
                    '${AppStrings.poundLE} 3.555',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: '',
                          fontSize: AppSize.s20,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s16),
              Container(
                height: AppSize.s60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s10),
                  color: AppColor.primary,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppStrings.checkout,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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