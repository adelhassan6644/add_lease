import 'package:add_lease/app/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../../../app/core/utils/app_strings.dart';
import '../../../app/core/utils/color_resources.dart';
import '../../../app/core/utils/constant.dart';
import '../../../app/core/utils/dimensions.dart';
import '../../../app/core/utils/images.dart';
import '../../../data/model/lease_model.dart';

class LeaseUnit extends StatefulWidget {
  final MyLeasesModel lease;

  const LeaseUnit({required this.lease, Key? key}) : super(key: key);

  @override
  State<LeaseUnit> createState() => _LeaseUnitState();
}

class _LeaseUnitState extends State<LeaseUnit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SEMI_LARGE),
      decoration: const BoxDecoration(color: ColorResources.fillColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.lease.title ?? "", style: darkPoppinsTextStyle),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.lease.subTitle ?? "",
                    style: hintPoppinsTextStyle,
                  )
                ],
              ),
              Container(
                height: 32,
                width: 103,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: widget.lease.status == "Pending"
                        ? const Color(0xfff6f1e1)
                        : const Color(0xffe6f2ee),
                    borderRadius: BorderRadius.circular(50.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      widget.lease.status == "Pending"
                          ? Images.refreshCircleIcon
                          : Images.doneIcon,
                    ),
                    const SizedBox(
                      width: 5.35,
                    ),
                    Text(
                      widget.lease.status ?? "",
                      style: TextStyle(
                        color: widget.lease.status == "Pending"
                            ? const Color(0xffA6840A)
                            : const Color(0xff2FAB86),
                        fontWeight: FontWeight.w600,
                        fontFamily: AppStrings.hintFontFamily,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 26.5,
          ),
          Row(
            children: [
              SvgPicture.asset(
                Images.buildingIcon,
              ),
              const SizedBox(
                width: 9.25,
              ),
              Text(
                widget.lease.leaseType ?? "",
                style: hintPoppinsTextStyle,
              )
            ],
          ),
          const SizedBox(
            height: 17.25,
          ),
          Text(
            "${widget.lease.price}SAR",
            style: primaryPoppinsTextStyle,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Start date".toUpperCase(),
                    style: smallTitlePoppinsTextStyle,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    widget.lease.startDate?.dateFormat1() ??
                        DateTime.now().dateFormat(),
                    style: datePoppinsTextStyle,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "End date".toUpperCase(),
                    style: smallTitlePoppinsTextStyle,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    widget.lease.endDate?.dateFormat1() ??
                        DateTime.now().dateFormat(),
                    style: datePoppinsTextStyle,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Last Billing".toUpperCase(),
                    style: smallTitlePoppinsTextStyle,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    widget.lease.lastBilling?.dateFormat1() ??
                        DateTime.now().dateFormat(),
                    style: datePoppinsTextStyle,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 24.0,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                width: 56,
                height: 44,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: ColorResources.whiteColor),
                child: SvgPicture.asset(
                  Images.editIcon,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Container(
                  padding: const EdgeInsets.all(12.0),
                  width: 99,
                  height: 44,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: ColorResources.whiteColor),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Images.documentTextIcon,
                      ),
                      const SizedBox(
                        width: 10.5,
                      ),
                      const Text(
                        "PDF",
                        style: TextStyle(
                            color: ColorResources.textDarkColor,
                            fontSize: 13,
                            fontFamily: AppStrings.textFontFamily,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
