import 'package:flutter/material.dart';
import 'package:moka_store/core/utils/font_manager.dart';
import 'package:moka_store/core/utils/values_manager.dart';
import '../../core/utils/color_manager.dart';

Widget defaultButton({
  double width = double.infinity,
  double height = AppSize.s60,
  Color backgroundColor = AppColor.primary,
  Color borderColor = AppColor.primary,
  Color fontColor = Colors.white,
  bool isUpperCase = true,
  double radius = AppSize.s3,
  double borderWidth = 0,
  double fontSize = AppFontSize.s16,
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
                size: AppSize.s20,
                color: AppColor.white,
              ),
            if (prefix != null)
              const SizedBox(
                width: AppSize.s20,
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
