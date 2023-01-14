import 'package:flutter/material.dart';
import '../../../presentation/base/custom_button.dart';
import 'app_strings.dart';
import 'color_resources.dart';
import 'dimensions.dart';
import 'images.dart';

 const OutlineInputBorder outLineInputBorderStyle =   OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(Dimensions.RADIUS_SIZE_DEFAULT),
  ),
  borderSide: BorderSide(
    style: BorderStyle.solid,
    color: ColorResources.transparentColor,
  ),
);

 const OutlineInputBorder errorOutLineInputBorderStyle =   OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(Dimensions.RADIUS_SIZE_DEFAULT),
  ),
  borderSide: BorderSide(
    width: 1,
    style: BorderStyle.solid,
    color: ColorResources.errorBorderColor,
  ),
);


 const TextStyle darkRalewayTextStyle = TextStyle(
     color: ColorResources.textDarkColor,
     fontSize: 13,
     fontFamily: AppStrings.hintFontFamily,
     fontWeight: FontWeight.w600);

const TextStyle hintRalewayTextStyle = TextStyle(
    color: ColorResources.disableColor,
    fontSize: 13,
    fontFamily: AppStrings.hintFontFamily,
    fontWeight: FontWeight.w700);

const TextStyle errorHintRalewayTextStyle = TextStyle(
    color: ColorResources.errorBorderColor,
    fontSize: 13,
    fontFamily: AppStrings.hintFontFamily,
    fontWeight: FontWeight.w600);

const TextStyle selectRalewayTextStyle = TextStyle(
    color: ColorResources.primary,
    fontSize: 13,
    fontFamily: AppStrings.hintFontFamily,
    fontWeight: FontWeight.w700);

const TextStyle disSelectRalewayTextStyle = TextStyle(
    color: ColorResources.disableColor,
    fontSize: 13,
    fontFamily: AppStrings.hintFontFamily,
    fontWeight: FontWeight.w700);

const TextStyle buttonRalewayTextStyle1 =  TextStyle(
    color: ColorResources.whiteColor,
    fontSize: 13,
    fontFamily: AppStrings.hintFontFamily,
    fontWeight: FontWeight.w800);

const TextStyle buttonRalewayTextStyle2 =  TextStyle(
    color: ColorResources.primary,
    fontSize: 13,
    fontFamily: AppStrings.hintFontFamily,
    fontWeight: FontWeight.w800);

const TextStyle primaryPoppinsTextStyle = TextStyle(
    color: ColorResources.primary,
    fontSize: 18,
    fontFamily: AppStrings.textFontFamily,
    fontWeight: FontWeight.w700);


const TextStyle darkPoppinsTextStyle = TextStyle(
    color: ColorResources.textDarkColor,
    fontSize: 14,
    fontFamily: AppStrings.textFontFamily,
    fontWeight: FontWeight.w700);

const TextStyle hintPoppinsTextStyle = TextStyle(
    color: ColorResources.disableColor,
    fontSize: 13,
    fontFamily: AppStrings.textFontFamily,
    fontWeight: FontWeight.w600);

const TextStyle errorHintPoppinsTextStyle = TextStyle(
    color: ColorResources.errorBorderColor,
    fontSize: 13,
    fontFamily: AppStrings.hintFontFamily,
    fontWeight: FontWeight.w600);

const TextStyle selectPoppinsTextStyle = TextStyle(
    color: ColorResources.primary,
    fontSize: 13,
    fontFamily: AppStrings.hintFontFamily,
    fontWeight: FontWeight.w700);

const TextStyle smallTitlePoppinsTextStyle = TextStyle(
    color: ColorResources.disableColor,
    fontSize: 12,
    fontFamily: AppStrings.textFontFamily,
    fontWeight: FontWeight.w800);

const TextStyle datePoppinsTextStyle = TextStyle(
    color: ColorResources.textDarkColor,
    fontSize: 13,
    fontFamily: AppStrings.textFontFamily,
    fontWeight: FontWeight.w500);

const TextStyle disSelectPoppinsTextStyle = TextStyle(
    color: ColorResources.disableColor,
    fontSize: 13,
    fontFamily: AppStrings.hintFontFamily,
    fontWeight: FontWeight.w700);

const TextStyle buttonPoppinsTextStyle1 =  TextStyle(
    color: ColorResources.whiteColor,
    fontSize: 13,
    fontFamily: AppStrings.hintFontFamily,
    fontWeight: FontWeight.w800);

const TextStyle buttonPoppinsTextStyle2 =  TextStyle(
    color: ColorResources.primary,
    fontSize: 13,
    fontFamily: AppStrings.hintFontFamily,
    fontWeight: FontWeight.w800);


 BoxDecoration decoration1 = BoxDecoration(
  borderRadius:  const BorderRadius.all(
      Radius.circular(Dimensions.RADIUS_SIZE_DEFAULT)),
  border: Border.all(
      width: 1.00,
      color: ColorResources.shadowColor,
      style: BorderStyle.solid),
);

 BoxDecoration decoration =BoxDecoration(
    borderRadius: const BorderRadius.all(
        Radius.circular(Dimensions.RADIUS_SIZE_DEFAULT)),
    border: Border.all(
        color: ColorResources.transparentColor,
        style: BorderStyle.solid),
    color: ColorResources.fillColor);


 Widget hSpace = const SizedBox(
   height: Dimensions.PADDING_SIZE_DEFAULT,
 );

Widget wSpace = const SizedBox(
  width:8,
);

