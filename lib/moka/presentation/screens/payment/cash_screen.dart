import 'package:flutter/material.dart';
import 'package:moka_store/core/network/api_constance.dart';
import 'package:moka_store/core/utils/color_manager.dart';
import 'package:moka_store/core/utils/constants_manager.dart';
import 'package:moka_store/core/utils/font_manager.dart';
import 'package:moka_store/core/utils/strings_manager.dart';
import 'package:moka_store/core/utils/values_manager.dart';
import '../../../../core/utils/icons_manager.dart';
import '../../../../core/utils/routes_manager.dart';

class CashScreen extends StatelessWidget {
  const CashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.cash),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: AppPadding.p4,
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.mainRoute,
                        (route) => false,
                  );
                },
                icon: const Icon(
                  IconBroken.Home,

                )),
          )
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: AppSize.s24,
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.goSupermarket,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: AppSize.s20),
            Text(
              AppStrings.orderNum,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: AppFontSize.s18,
                    color: AppColor.black,
                height: AppSize.s1_5,
                  ),
            ),
            const SizedBox(height: AppSize.s20),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColor.primary,
                  width: AppConstants.cD2,
                ),
                borderRadius: BorderRadius.circular(AppSize.s14),
              ),
              elevation: AppConstants.cD10,
              color: AppColor.scaffoldBackGround,
              child: Padding(
                padding: const EdgeInsets.all(AppSize.s8),
                child: SelectableText(
                  ApiConstance.REFCODE,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: AppSize.s40,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
