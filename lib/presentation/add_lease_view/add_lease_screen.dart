import 'package:add_lease/presentation/add_lease_view/add_lease_views/deposits_view/deposits_view.dart';
import 'package:add_lease/presentation/add_lease_view/add_lease_views/extra_charges_view/extra_charges_view.dart';
import 'package:add_lease/presentation/add_lease_view/add_lease_views/info_view/info_view.dart';
import 'package:add_lease/presentation/add_lease_view/add_lease_views/tenants_view/tenants_view.dart';
import 'package:add_lease/presentation/add_lease_view/add_lease_views/uitility_charges_view/utility_charges_view.dart';
import 'package:add_lease/presentation/add_lease_view/units/animated_bottom_item/animated_bottom_item.dart';
import 'package:add_lease/presentation/add_lease_view/units/liner_step_indicator_unit/linear_step_indicator.dart';
import 'package:add_lease/presentation/base/custom_app_bar.dart';
import 'package:add_lease/presentation/provider/lease_provider/lease_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app/core/utils/app_strings.dart';
import '../../app/core/utils/color_resources.dart';
import 'add_lease_views/late_fees_view/late_fees_view.dart';

class AddLeaseScreen extends StatefulWidget {
  const AddLeaseScreen({Key? key}) : super(key: key);

  @override
  AddLeaseScreenState createState() => AddLeaseScreenState();
}

class AddLeaseScreenState extends State<AddLeaseScreen> {

  List<String> stepLabel = [
    "Info",
    "Deposits",
    "Tenants",
    "Extra Charges",
    "Late Fees",
    "Utility Charges"
  ];

  List<Widget> addLeaseViews = [
   const InfoView(),
    const DepositsView(),
    const TenantsView(),

    const ExtraChargesView(),
    const LateFeesView(),
    const UtilityChargesView(),
  ];

  int activeStep = 1 ; // Initial step set to 6.
  late PageController pageController ;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController = PageController();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: AppStrings.addLeaseTitle,
          titleCenter: true,
          showLeading: true,
          actionChild: SizedBox(
            child: Row(
              children:[
                Text(activeStep.toString(),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontFamily: AppStrings.textFontFamily,
                      color: ColorResources.selectGreenColor, fontSize: 14),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "OUT OF 6",
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ),
        ),
        backgroundColor: ColorResources.whiteColor,
        body: SafeArea(
          child: Column(
            children: [
              Consumer<LeaseProvider>(
                builder: (context,leaseProvider,c) {
                  return LinearStepIndicator(
                    steps: 6,
                    controller: pageController,
                   // passPage: leaseProvider.passPage,
                    labels: List<String>.generate(
                        6, (index) => stepLabel[index]),
                    nodeSize: 32,
                  );
                }
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged:_onPageViewChange,
                  physics: const NeverScrollableScrollPhysics(),
                  children:<Widget>[...addLeaseViews],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AnimatedButtonItem( pageController: pageController,)

    );
  }


  _onPageViewChange(int page) {
    setState(() {
      activeStep = page + 1;
    });
  }
}
