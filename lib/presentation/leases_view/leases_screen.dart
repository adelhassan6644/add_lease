import 'package:add_lease/app/core/utils/dimensions.dart';
import 'package:add_lease/app/core/utils/images.dart';
import 'package:add_lease/presentation/leases_view/units/lease_unit.dart';
import 'package:add_lease/presentation/provider/my_leases_provider/my_leases_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../app/core/utils/app_strings.dart';
import '../../app/core/utils/color_resources.dart';
import '../base/custom_app_bar.dart';

class LeasesScreen extends StatefulWidget {
  const LeasesScreen({Key? key}) : super(key: key);

  @override
  State<LeasesScreen> createState() => _LeasesScreenState();
}

class _LeasesScreenState extends State<LeasesScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<MyLeasesProvider>(context, listen: false).getLeasesData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.leasesTitle,
        showLeading: true,
        leadingAction:  InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              Images.arrowRightIcon,
              color: ColorResources.whiteColor,
            )
        ),
        actionChild: InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              Images.searchNormalIcon,
              color: ColorResources.whiteColor,
            )),
      ),
      backgroundColor: ColorResources.whiteColor,
      body: Consumer<MyLeasesProvider>(
          builder: (context, myLeasesProvider, child) {
        return RefreshIndicator(
          onRefresh: () async {
            await myLeasesProvider.getLeasesData();
          },
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: Dimensions.PADDING_SIZE_SMALL),
              child: LeaseUnit(lease: myLeasesProvider.myLeases[index]),
            ),
            itemCount: myLeasesProvider.myLeases.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
          ),
        );
      }),
    );
  }
}
