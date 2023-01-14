import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../../app/core/utils/color_resources.dart';
import '../../../../../app/core/utils/constant.dart';
import '../../../../provider/lease_provider/lease_provider.dart';

class SwitchUnit extends StatelessWidget {
  const SwitchUnit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<LeaseProvider>(
        builder: (context, leaseProvider, child){
          return Container(
            padding:const EdgeInsets.symmetric(vertical: 20, horizontal: 24) ,
            decoration: decoration1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("in Advance",style:darkPoppinsTextStyle ,),
                CupertinoSwitch(
                    activeColor: ColorResources.primary,
                    value: leaseProvider.switchValue,
                    onChanged: (value) {
                      leaseProvider.onSwitchAdvanced();
                    }),
              ],
            ),
          );

        });
  }
}
