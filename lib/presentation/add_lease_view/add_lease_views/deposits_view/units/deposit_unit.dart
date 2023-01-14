import 'package:add_lease/data/model/deposit_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../app/core/utils/constant.dart';
import '../../../../../app/core/utils/dimensions.dart';
import '../../../../../app/core/utils/validation.dart';
import '../../../../base/custom_drop_down_button.dart';
import '../../../../base/custom_text_form_field.dart';
import '../../../../provider/lease_provider/lease_provider.dart';

class DepositUnit extends StatefulWidget {

  final DepositModel depositModel;

  const DepositUnit({required this.depositModel, Key? key})
      : super(key: key);

  @override
  State<DepositUnit> createState() => _DepositUnitState();
}

class _DepositUnitState extends State<DepositUnit> {
  late final TextEditingController _rentDepositAmountController;
  late final TextEditingController _depositAmountController;

  @override
  void initState() {
    _rentDepositAmountController =
        TextEditingController(text: widget.depositModel.rentDepositAmount);
    _depositAmountController =
        TextEditingController(text: widget.depositModel.depositAmount);
    _rentDepositAmountController.addListener(() {
      widget.depositModel.rentDepositAmount =
          _rentDepositAmountController.value.text;
    });
    _depositAmountController.addListener(() {
      widget.depositModel.depositAmount = _depositAmountController.value.text;

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return  Column(
        children: [
          Container(
            decoration: decoration1,
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
            child: Column(
              children: [
                CustomTextFormField(
                  hint: "Rent deposit amount",
                  label: false,
                  type: TextInputType.number,
                  controller: _rentDepositAmountController,
                  valid: Validations.any,
                ),
                hSpace,
                CustomDropDownButton(
                  items: Provider.of<LeaseProvider>(context,listen: false).utilityNamesOfDeposit,
                  name: "Utility name",
                  iconSize: 30,
                  onChange: (item) {
                    setState(() {
                      widget.depositModel.utilityName = item.toString();
                    });
                  },
                  value: widget.depositModel.utilityName ,
                  validation: Validations.any,
                ),
                hSpace,
                CustomTextFormField(
                  hint: "Deposit amount",
                  label: false,
                  type: TextInputType.number,
                  controller: _depositAmountController,
                  valid: Validations.any,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      );
  }
}
