import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/constant.dart';
import '../../app/core/utils/dimensions.dart';

class CustomButtonPicker extends StatelessWidget {
  final IconData? icon;
  final String? assetIcon;
  final double iconSize;
  final String text;
  final void Function() onTap;
  bool valid;

  CustomButtonPicker(
      {required this.text,
      this.icon,
      this.valid = false,
      required this.onTap,
      this.assetIcon,
      this.iconSize = 25,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 24),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                  Radius.circular(Dimensions.RADIUS_SIZE_DEFAULT)),
              border: Border.all(
                  color: valid
                      ? ColorResources.errorBorderColor
                      : ColorResources.transparentColor,
                  style: BorderStyle.solid),
              color: ColorResources.fillColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: hintPoppinsTextStyle,
              ),
              icon == null
                  ? SvgPicture.asset(
                      assetIcon ?? "",
                      height: iconSize,
                      width: iconSize,
                      color: ColorResources.disableColor,
                    )
                  : Icon(
                      icon,
                      size: iconSize,
                      color: ColorResources.disableColor,
                    )
            ],
          ),
        ));
  }
}
