import 'package:add_lease/app/core/utils/dimensions.dart';
import 'package:add_lease/app/core/utils/extensions.dart';
import 'package:add_lease/app/core/utils/images.dart';
import 'package:add_lease/app/core/utils/validation.dart';
import 'package:add_lease/presentation/provider/lease_provider/lease_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../app/core/utils/constant.dart';
import '../../../base/custom_button_picker.dart';
import '../../../base/custom_date_picker.dart';
import '../../../base/custom_drop_down_button.dart';
import '../../../base/custom_text_form_field.dart';

class InfoView extends StatefulWidget {
  const InfoView({Key? key}) : super(key: key);

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LeaseProvider>(builder: (context, leaseProvider, child) {
      return Form(
        key: leaseProvider.infoFormKey,
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              CustomDropDownButton(
                items: leaseProvider.propertyItemsOfInfo,
                name: "Property",
                iconSize: 30,
                onChange: leaseProvider.onSelectedPropertyItemsOfInfo,
                value: leaseProvider.selectedPropertyItemsOfInfo,
                validation: Validations.any,
              ),
              hSpace,
              CustomDropDownButton(
                onChange: leaseProvider.onSelectedUnitsItemOfInfo,
                items: leaseProvider.unitsItemOfInfo,
                name: "Units",
                iconSize: 30,
                value: leaseProvider.selectedUnitsItemOfInfo,
                validation: Validations.any,
              ),
              hSpace,
              CustomDropDownButton(
                onChange: leaseProvider.onSelectedLeaseTypeItemOfInfo,
                items: leaseProvider.leaseTypeItemOfInfo,
                name: "Lease Type",
                iconSize: 30,
                value: leaseProvider.selectedLeaseTypeItemOfInfo,
                validation: Validations.any,
              ),
              hSpace,
              CustomTextFormField(
                hint: "Rent Amount",
                label: false,
                // error: Validations.any == "required" ? true:false,
                type: TextInputType.number,
                controller: leaseProvider.rentAmountControllerOfInfo,
                valid: Validations.any,
              ),
              hSpace,
              CustomButtonPicker(
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDatePicker(
                          title: "Start Date",
                          dateTime: leaseProvider.startDateTimeOfInfo ??
                              DateTime.now(),
                          onChangeTime:
                              leaseProvider.onStartDateTimeChangedOfInfo,
                        );
                      });
                },
                text: leaseProvider.startDateTimeOfInfo?.dateTimeFormat() ??
                    "Start Date",
                assetIcon: Images.calenderIcon,

              ),
              hSpace,
              CustomButtonPicker(
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDatePicker(
                          title: "End Date",
                          dateTime:
                              leaseProvider.endDateTimeOfInfo ?? DateTime.now(),
                          onChangeTime:
                              leaseProvider.onEndDateTimeChangedOfInfo,
                        );
                      });
                },
                text: leaseProvider.endDateTimeOfInfo?.dateTimeFormat() ??
                    "End Date",
                assetIcon: Images.calenderIcon,
              ),
              hSpace,
              CustomButtonPicker(
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDatePicker(
                          dateType: CupertinoDatePickerMode.date,
                          title: "Day",
                          dateTime:
                              leaseProvider.selectDayOfInfo ?? DateTime.now(),
                          onChangeTime:
                              leaseProvider.onSelectDateTimeChangedOfInfo,
                        );
                      });
                },
                text: leaseProvider.selectDayOfInfo?.dateFormat() ??
                    "Due on (Select Day)",
                assetIcon: Images.calenderIcon,
              ),
              hSpace,
              CustomTextFormField(
                hint: "For Propose activity type",
                removePIcon: true,
                label: true,
                type: TextInputType.text,
                controller: leaseProvider.forProposeActivityTypeOfInfo,
                maxLine: 5,
                valid: Validations.any,

              ),
            ],
          ),
        ),
      );
    });
  }
}
