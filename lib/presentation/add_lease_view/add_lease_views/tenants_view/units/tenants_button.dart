import 'package:add_lease/app/core/utils/media_query_values.dart';
import 'package:add_lease/presentation/add_lease_view/add_lease_views/tenants_view/units/tenant_pop_up.dart';
import 'package:add_lease/presentation/provider/lease_provider/lease_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../app/core/utils/color_resources.dart';
import '../../../../../app/core/utils/constant.dart';
import '../../../../../app/core/utils/dimensions.dart';

class TenantsButton extends StatefulWidget {
  const TenantsButton({Key? key}) : super(key: key);

  @override
  State<TenantsButton> createState() => _TenantsButtonState();
}

class _TenantsButtonState extends State<TenantsButton> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<LeaseProvider>(
        builder: (context, leaseProvider, child){
        return Form(
          key: leaseProvider.tenantsFormKey,
          child: InkWell(
            onTap: () async {
              showGeneralDialog(
                barrierLabel: "showGeneralDialog",
                barrierDismissible: true,
                transitionDuration: const Duration(milliseconds: 500),
                context: context,
                pageBuilder: (context, _, __) {
                  return const Align(
                    alignment: Alignment.bottomCenter,
                    child: TenantPopUP(),
                  );
                },
                transitionBuilder: (_, animation1, __, child) {
                  return SlideTransition(
                    position: Tween(
                      begin: const Offset(0, 1),
                      end: const Offset(0, 0),
                    ).animate(animation1),
                    child: child,
                  );
                },
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 70,
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 24),
              width: context.width ,
              decoration:   const BoxDecoration(
                  color: ColorResources.fillColor ,
                  borderRadius:  BorderRadius.all(
                      Radius.circular( Dimensions.RADIUS_SIZE_DEFAULT))),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // leaseProvider.selectTenants.isNotEmpty?leaseProvider.selectTenants.first.tenantName! :
                  const Text("Tenants",
                    style: hintPoppinsTextStyle,
                  ),
                  wSpace,
                  const Icon(Icons.arrow_drop_down,color: ColorResources.disableColor ,size:25 ),

                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
