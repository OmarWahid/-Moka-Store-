import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:moka_store/core/utils/color_manager.dart';
import '../../../../core/utils/constants_manager.dart';
import '../../../../core/utils/strings_manager.dart';
import '../../../../core/utils/values_manager.dart';

class CarouselSliderItem extends StatelessWidget {
  const CarouselSliderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: listCategory.map((e) {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      e.image,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: AppPadding.p18,
                left: AppPadding.p24,
                child: Text(
                  e.name,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColor.white),
                ),
              )
            ],
          );
        }).toList(),
        options: CarouselOptions(
          height: AppSize.s200,
          viewportFraction: AppConstants.cD1,
          initialPage: AppConstants.cI0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: AppConstants.playInterval),
          autoPlayAnimationDuration:
              const Duration(milliseconds: AppConstants.playAnimation),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ));
  }
}

class ComponentCategories extends Equatable {
  final String image;
  final String name;

  const ComponentCategories({required this.image, required this.name});

  @override
  List<Object> get props => [image, name];
}

List<ComponentCategories> listCategory = [
  const ComponentCategories(
    image: AppStrings.categoryImage1,
    name: AppStrings.categoryName1,
  ),
  const ComponentCategories(
    image: AppStrings.categoryImage2,
    name: AppStrings.categoryName2,
  ),
  const ComponentCategories(
    image: AppStrings.categoryImage3,
    name: AppStrings.categoryName3,
  ),
  const ComponentCategories(
    image: AppStrings.categoryImage4,
    name: AppStrings.categoryName4,
  ),
];
