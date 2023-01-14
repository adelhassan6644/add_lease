import 'package:add_lease/app/core/utils/constant.dart';
import 'package:add_lease/app/core/utils/dimensions.dart';
import 'package:add_lease/presentation/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/core/utils/color_resources.dart';
import '../../../../app/core/utils/images.dart';
import '../../../provider/lease_provider/lease_provider.dart';

class DepositsView extends StatefulWidget {
  const DepositsView({Key? key}) : super(key: key);

  @override
  State<DepositsView> createState() => _DepositsViewState();
}

class _DepositsViewState extends State<DepositsView> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<LeaseProvider>(context, listen: false).addFirstUnit(index: 0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LeaseProvider>(builder: (context, leaseProvider, child) {
      return Form(
        key: leaseProvider.depositsFormKey,
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: Column(
            children: [
              Expanded(
                child: AnimatedList(
                  controller: leaseProvider.scrollController,
                  key: leaseProvider.listKey,
                  physics: const BouncingScrollPhysics(),
                  initialItemCount: leaseProvider.depositUnits.length,
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.RADIUS_SIZE_DEFAULT),
                  itemBuilder: (context, index, animation) => SlideTransition(
                    key: UniqueKey(),
                    position: animation.drive(leaseProvider.offset),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: [
                            leaseProvider.depositUnits[index],
                            if (leaseProvider.depositUnits.length != 1)
                              Positioned(
                                bottom: 0,
                                right: Dimensions.PADDING_SIZE_LARGE,
                                child: CustomButton(
                                  text: "Remove",
                                  width: 90,
                                  height: 35,
                                  isSmall: true,
                                  assetIcon: Images.minusIcon,
                                  iconColor: ColorResources.redColor,
                                  iconSize: 12,
                                  textColor: ColorResources.redColor,
                                  backgroundColor:
                                      ColorResources.lightRedBackGroundColor,
                                  onTap: () {
                                    leaseProvider.removeDepositUnit(
                                        index: index);
                                  },
                                ),
                              ),
                          ],
                        ),
                        hSpace,
                        if (index == leaseProvider.depositUnits.length - 1)
                          CustomButton(
                              textColor: ColorResources.primary,
                              text: "Another utility deposit",
                              backgroundColor:
                                  ColorResources.lightBackgroundColor,
                              onTap: () {
                                leaseProvider.addDepositUnit(index: index + 1);
                              }),
                        if (index != 0)
                          Column(
                            children: [
                              hSpace,
                              Text(
                                "You added ${leaseProvider.depositUnits.length}",
                                style: hintPoppinsTextStyle,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
