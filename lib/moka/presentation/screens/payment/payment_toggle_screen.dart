import 'package:flutter/material.dart';
import 'package:moka_store/core/utils/assets_manager.dart';
import 'package:moka_store/core/utils/color_manager.dart';
import 'package:moka_store/core/utils/routes_manager.dart';
import 'package:moka_store/core/utils/strings_manager.dart';
import 'package:moka_store/core/utils/values_manager.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.p18,
                  bottom: AppPadding.p6,
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.cashRoute);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                    border: Border.all(color: AppColor.grey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          child: Image.asset(
                            ImageAssets.card,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSize.s10),
                      Text(
                        AppStrings.paymentWithCard,
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: AppSize.s18,
                                ),
                      ),
                      const SizedBox(height: AppSize.s10),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSize.s24),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.cashRoute);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          child: Image.asset(
                            ImageAssets.machineCard,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSize.s10),
                      Text(
                        AppStrings.paymentWithCash,
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: AppSize.s18,
                                ),
                      ),
                      const SizedBox(height: AppSize.s10),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSize.s8),
          ],
        ),
      ),
    );
  }
}
