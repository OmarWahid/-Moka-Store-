import 'package:flutter/material.dart';
import 'package:moka_store/core/utils/strings_manager.dart';
import 'package:moka_store/core/utils/values_manager.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/icons_manager.dart';
import '../../../../core/utils/routes_manager.dart';
import '../../components/products_items.dart';

class CategoryItemsScreen extends StatelessWidget {
  final item ;
  const CategoryItemsScreen({required this.item,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Padding(
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
                        Navigator.pushNamed(context, Routes.searchRoute,
                            arguments: item);
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
              Padding(
                padding: const EdgeInsets.only(
                  bottom: AppPadding.p18,
                ),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: AppSize.s16,
                    crossAxisSpacing: AppSize.s16,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) => ProductItems(
                    item: item[index],
                  ),
                  itemCount: item.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
