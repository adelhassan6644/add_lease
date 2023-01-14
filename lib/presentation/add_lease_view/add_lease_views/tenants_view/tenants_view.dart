import 'package:add_lease/presentation/add_lease_view/add_lease_views/tenants_view/units/tenants_button.dart';
import 'package:flutter/material.dart';
import '../../../../app/core/utils/dimensions.dart';

class TenantsView extends StatelessWidget {
  const TenantsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: const [
          TenantsButton(),
        ],
      )
    );
  }
}
