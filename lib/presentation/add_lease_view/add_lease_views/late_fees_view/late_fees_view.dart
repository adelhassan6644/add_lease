import 'package:add_lease/app/core/utils/color_resources.dart';
import 'package:add_lease/app/core/utils/extensions.dart';
import 'package:add_lease/presentation/provider/lease_provider/lease_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../app/core/utils/constant.dart';
import '../../../../app/core/utils/dimensions.dart';
import '../../../../app/core/utils/images.dart';
import '../../../../app/core/utils/validation.dart';
import '../../../base/custom_button_picker.dart';
import '../../../base/custom_check_box_list_tile.dart';
import '../../../base/custom_date_picker.dart';
import '../../../base/custom_drop_down_button.dart';
import '../../../base/custom_text_form_field.dart';

class LateFeesView extends StatefulWidget {
  const LateFeesView({Key? key}) : super(key: key);

  @override
  State<LateFeesView> createState() => _LateFeesViewState();
}

class _LateFeesViewState extends State<LateFeesView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LeaseProvider>(
        builder: (context, leaseProvider, child) {
          return Form(
            key: leaseProvider.lateFeesFormKey,
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  CustomDropDownButton(
                    items: leaseProvider.discountType,
                    name: "Discount Type",
                    iconSize: 30,
                    onChange: leaseProvider.onSelectDiscountType,
                    value: leaseProvider.selectedDiscountType,
                    validation: Validations.any,
                  ),
                  hSpace,
                  CustomTextFormField(
                    hint: "Discount Amount",
                    label: false,
                    type: TextInputType.number,
                    controller: leaseProvider.discountAmountController,
                    valid: Validations.any,
                  ),
                  hSpace,
                  CustomButtonPicker(
                    onTap: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) {
                            return  CustomDatePicker(
                              title: "Generate invoice on (Day)",
                              dateType: CupertinoDatePickerMode.date,
                              dateTime: leaseProvider.generateInvoiceOnDay??DateTime.now(),
                              onChangeTime: leaseProvider.onGenerateInvoiceOnDay,

                            );
                          });
                    },
                    text:leaseProvider.generateInvoiceOnDay?.dateFormat() ?? "Generate invoice on (Day)",
                    assetIcon: Images.calenderIcon,
                  ),
                  hSpace,
                  ListView.builder(
                      itemCount: leaseProvider.lateFeesType.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index) {
                        return Container(
                          height: 85,
                           alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: leaseProvider.selectedLateFeesType == leaseProvider.lateFeesType[index]?
                                ColorResources.lightBackgroundColor: ColorResources.whiteColor,
                            border:  Border.symmetric(
                           horizontal: BorderSide(
                             color: ColorResources.shadowColor,
                             style: BorderStyle.solid,
                             width:1
                              )
                            )
                          ),
                          child: CustomCheckBoxListTile(
                            title:leaseProvider.lateFeesType[index].lateFeesType??"",
                            subTitle:leaseProvider.lateFeesType[index].lateFeesTypeDescription,
                            value: leaseProvider.selectedLateFeesType == leaseProvider.lateFeesType[index]? true: false,
                            onChange: (value){leaseProvider.onSelectLateFeesType(lateFeesType: leaseProvider.lateFeesType[index],
                                value: value);},
                          ),
                        );
                      }
                  )

                ],
              ),
            ),
          );
        });  }
}
