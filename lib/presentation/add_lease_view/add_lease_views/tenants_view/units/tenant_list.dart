import 'package:add_lease/app/core/utils/media_query_values.dart';
import 'package:add_lease/presentation/provider/lease_provider/lease_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../../app/core/utils/dimensions.dart';
import '../../../../base/custom_check_box_list_tile.dart';

class TenantList extends StatefulWidget {
  const TenantList({Key? key}) : super(key: key);

  @override
  State<TenantList> createState() => _TenantList();
}

class _TenantList extends State<TenantList> {

  @override
  void initState() {
    Future.delayed(Duration.zero,(){Provider.of<LeaseProvider>(context,listen: false).initialTenantList();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<LeaseProvider>(
        builder: (context, leaseProvider, child) {
          return  CupertinoScrollbar(
            thickness: 4.0,
            thumbVisibility: true,
            radius: const Radius.circular(Dimensions.RADIUS_SIZE_EXTRA_SMALL),
            child: SizedBox(
              height: context.height*0.26,
              child: ListView.builder(
                  itemCount: leaseProvider.findTenants.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical:0),
                      child: CustomCheckBoxListTile(
                        title:leaseProvider.findTenants[index].tenantName??"",
                        value: leaseProvider.selectTenants.contains(leaseProvider.findTenants[index]),
                        onChange: (value){leaseProvider.onSelectTenant(tenant: leaseProvider.findTenants[index],value: value);},
                      ),
                    );
                  }
              ),
            ),
          );
        });
  }
}
