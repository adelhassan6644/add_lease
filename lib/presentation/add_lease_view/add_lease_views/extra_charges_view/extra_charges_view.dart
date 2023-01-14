import 'package:add_lease/app/core/utils/extensions.dart';
import 'package:add_lease/presentation/provider/lease_provider/lease_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../app/core/utils/constant.dart';
import '../../../../app/core/utils/dimensions.dart';
import '../../../../app/core/utils/images.dart';
import '../../../../app/core/utils/validation.dart';
import '../../../base/custom_button_picker.dart';
import '../../../base/custom_date_picker.dart';
import '../../../base/custom_drop_down_button.dart';
import '../../../base/custom_text_form_field.dart';
import '../deposits_view/units/switch_unit.dart';

class ExtraChargesView extends StatefulWidget {
  const ExtraChargesView({Key? key}) : super(key: key);

  @override
  State<ExtraChargesView> createState() => _ExtraChargesViewState();
}

class _ExtraChargesViewState extends State<ExtraChargesView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LeaseProvider>(
        builder: (context, leaseProvider, child) {
      return Form(
        key: leaseProvider.extraChangesFormKey,
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              CustomButtonPicker(
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return  CustomDatePicker(
                          title: "Start Date",
                          dateTime: leaseProvider.startDateTimeForExtraChanges??DateTime.now(),
                          onChangeTime: leaseProvider.onStartDateTimeChangedForExtraChanges,
                        );
                      });
                },
                text: leaseProvider.startDateTimeForExtraChanges?.dateTimeFormat() ?? "Start Date",
                assetIcon: Images.calenderIcon,
              ),
              hSpace,
              CustomButtonPicker(
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return  CustomDatePicker(
                          title: "End Date",
                          dateTime: leaseProvider.endDateTimeForExtraChanges??DateTime.now(),
                          onChangeTime: leaseProvider.onEndDateTimeChangedForExtraChanges,

                        );
                      });
                },
                text:leaseProvider.endDateTimeForExtraChanges?.dateTimeFormat() ?? "End Date",
                assetIcon: Images.calenderIcon,
              ),
              hSpace,
              CustomTextFormField(
                hint: "Frequent Amount",
                label: false,
                type: TextInputType.number,
                controller: leaseProvider.frequentAmountController,
                valid: Validations.any,
              ),
              hSpace,
              CustomDropDownButton(
                items: leaseProvider.propertyItemsOfExtraChanges,
                name: "Property",
                iconSize: 30,
                validation: Validations.any,
                value: leaseProvider.selectPropertyOfPayments,
                onChange: leaseProvider.onSelectPropertyOfPayments,
              ),
              hSpace,
              const SwitchUnit()
            ],
          ),
        ),
      );
    });
  }
}
