import 'package:add_lease/app/core/utils/media_query_values.dart';
import 'package:add_lease/presentation/provider/lease_provider/lease_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../app/core/utils/color_resources.dart';
import '../../../../../app/core/utils/constant.dart';
import '../../../../../app/core/utils/dimensions.dart';
import '../../../../base/custom_button.dart';
import '../../../../base/custom_text_form_field.dart';
import 'tenant_list.dart';

class TenantPopUP extends StatefulWidget {
  const TenantPopUP({Key? key,}) : super(key: key);

  @override
  _TenantPopUPState createState() => _TenantPopUPState();
}

class _TenantPopUPState extends State<TenantPopUP> {

  @override
  Widget build(BuildContext context) {
    return  Consumer<LeaseProvider>(
        builder: (context, leaseProvider, child)
    {return AlertDialog(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_SEMI_LARGE,
            vertical: Dimensions.PADDING_SIZE_DEFAULT),
        shape: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.transparent,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(
                Dimensions.RADIUS_SIZE_DEFAULT)),
        backgroundColor: ColorResources.whiteColor,
        alignment: Alignment.bottomCenter,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              child: Column(children: [
                Center(
                    child: Container(
                      height: 5,
                      width: 65,
                      decoration: const BoxDecoration(
                          color: ColorResources.backgroundColor,
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.RADIUS_SIZE_DEFAULT))),
                    )),
                hSpace,
                const Text(
                  "Select Tenant",
                  style: darkPoppinsTextStyle,
                ),
                hSpace,
                CustomTextFormField(
                  isHeightSmall: true,
                   removePIcon: true,
                  hint: "Search for a tenant",
                  label: false,
                  controller: leaseProvider.searchForTenantController,
                  onChanged: (value){leaseProvider.onSearchForTenant();},
                ),
                const TenantList(),
              ],),
            ),
            Container(
              decoration: BoxDecoration(
                  color: ColorResources.whiteColor,
                  border: Border.all(
                      color: ColorResources.lightBorderColor, width: 1.0),
                  boxShadow: const [
                    BoxShadow(
                      color: ColorResources.fillColor,
                      spreadRadius: 7,
                      blurRadius: 7,
                      offset: Offset(0, -3), // changes position of shadow
                    ),
                  ]),
              child: CustomButton(
                height: 56,
                backgroundColor: ColorResources.primary,
                textColor: ColorResources.whiteColor,
                text: "Submit",
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
