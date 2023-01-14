import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../app/core/utils/app_strings.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/constant.dart';
import '../../app/core/utils/dimensions.dart';
import 'custom_button.dart';

class CustomDatePicker extends StatefulWidget {


 final DateTime dateTime;
 final CupertinoDatePickerMode? dateType ;
 final String title;
 final ValueChanged<DateTime> onChangeTime;

 const CustomDatePicker({required this.dateTime,required this.title,required this.onChangeTime,
   this.dateType
   ,Key? key}) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorResources.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.RADIUS_SIZE_DEFAULT))
      ),
      padding:const EdgeInsets.only(
        top: Dimensions.PADDING_SIZE_LARGE,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: Container(height: 5,width: 65,
            decoration: const BoxDecoration(
                color: ColorResources.backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.RADIUS_SIZE_DEFAULT))
            ),)),
          hSpace,
           Text( "Select ${widget.title}",
            style: const TextStyle(
                fontSize:13,
                fontWeight: FontWeight.w700,
                fontFamily: AppStrings.hintFontFamily,
                color: ColorResources.lightBlackColor,
                decoration: TextDecoration.none
            ),),
          hSpace,
          SizedBox(
            height:250,
            child: CupertinoDatePicker(
              mode:widget.dateType?? CupertinoDatePickerMode.dateAndTime,
              initialDateTime: widget.dateTime,
              onDateTimeChanged: widget.onChangeTime,
            ),
          ),
          Material(
            child: CustomButton(
              height: 80,
              isFlat: true,
              backgroundColor: ColorResources.primary,
              textColor: ColorResources.whiteColor,
              text:"Submit",
              onTap: (){
                Navigator.of(context).pop();},
            ),
          )
        ],
      ),
    );  }
}
