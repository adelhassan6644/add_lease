import 'dart:developer';

import 'package:add_lease/app/core/utils/color_resources.dart';
import 'package:add_lease/app/core/utils/dimensions.dart';
import 'package:add_lease/app/core/utils/media_query_values.dart';
import 'package:add_lease/presentation/provider/lease_provider/lease_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/core/utils/constant.dart';
import '../../../base/custom_button.dart';

class AnimatedButtonItem extends StatefulWidget {
  final PageController pageController;

  const AnimatedButtonItem({required this.pageController, Key? key})
      : super(key: key);
  // final random = Random();
  @override
  State<AnimatedButtonItem> createState() => _AnimatedButtonItemState();
}

class _AnimatedButtonItemState extends State<AnimatedButtonItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LeaseProvider>(builder: (context, leaseProvider, child) {
      return Container(
        height: 100,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
            left: Dimensions.PADDING_SIZE_EXTRA_LARGE,
            right: Dimensions.PADDING_SIZE_EXTRA_LARGE,
            top: Dimensions.PADDING_SIZE_LARGE,
            bottom: Dimensions.PADDING_SIZE_SEMI_LARGE),
        decoration: BoxDecoration(
            color: ColorResources.whiteColor,
            border: Border.all(
                style: BorderStyle.none,
                color: ColorResources.transparentColor,
                width: 0.05),
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xff000000).withOpacity(0.05),
                blurRadius: 5,
                spreadRadius: 5,
                offset: const Offset(0, -3), // changes position of shadow
              ),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                //Back Bottom
                if (widget.pageController.page?.ceil() != 0 &&
                    widget.pageController.page?.ceil().toInt() != null)
                  Expanded(
                    child: CustomButton(
                      text: 'Back',
                      backgroundColor: ColorResources.lightBackgroundColor,
                      textColor: ColorResources.primary,
                      width: context.width * 0.43,
                      height: 54,
                      onTap: () {
                        leaseProvider.previousPage(
                            pageController: widget.pageController);
                      },
                    ),
                  ),

                //Space Between 2 Bottoms
                if (widget.pageController.page?.ceil() != 0 &&
                    widget.pageController.page?.ceil() != null)
                  const SizedBox(
                    width: Dimensions.PADDING_SIZE_DEFAULT,
                  ),

                //Continue & Submit Bottom
                Expanded(
                  child: InkWell(
                    onTap: () {
                      switch (widget.pageController.page?.ceil()) {
                        case 0:
                          {
                            leaseProvider.infoFormKey.currentState!.save();
                            if (leaseProvider.infoFormKey.currentState!
                                .validate()) {
                              leaseProvider.nextPage(
                                  pageController: widget.pageController);
                              return;
                            } else {
                              leaseProvider.onFailPage;
                              leaseProvider.nextPage(
                                  pageController: widget.pageController);
                               leaseProvider.onFailPage();

                            }
                            break;
                          }
                        case 1:
                          {
                             leaseProvider.depositsFormKey.currentState!.save();
                            if (leaseProvider.depositsFormKey.currentState!
                                .validate()) {
                              log("validddddddd");
                              leaseProvider.nextPage(
                                  pageController: widget.pageController);
                              return;
                            } else {
                              log("not validddddddd");
                              leaseProvider.onFailPage();

                            }
                            break;
                          }
                        case 2:
                          {
                            leaseProvider.tenantsFormKey.currentState!.save();
                            if (leaseProvider.tenantsFormKey.currentState!
                                .validate()) {
                              // leaseProvider.onPassPage;
                              leaseProvider.nextPage(
                                  pageController: widget.pageController);
                              return;
                            } else {
                              leaseProvider.onFailPage();
                            }
                            break;
                          }
                        case 3:
                          {
                            leaseProvider.extraChangesFormKey.currentState!.save();
                            if (leaseProvider.extraChangesFormKey.currentState!
                                .validate()) {
                              // leaseProvider.onPassPage;
                              leaseProvider.nextPage(
                                  pageController: widget.pageController);
                              return;
                            } else {
                              leaseProvider.onFailPage();
                            }
                            break;
                          }
                        case 4:
                          {
                            leaseProvider.lateFeesFormKey.currentState!.save();
                            if (leaseProvider.lateFeesFormKey.currentState!
                                .validate()) {
                              // leaseProvider.onPassPage;
                              leaseProvider.nextPage(
                                  pageController: widget.pageController);
                              return;
                            } else {

                              leaseProvider.onFailPage();
                            }
                            break;
                          }

                      }
                    },
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      height: 54,
                      width: widget.pageController.page == 0
                          ? context.width -
                              Dimensions.PADDING_SIZE_EXTRA_LARGE * 2
                          : context.width * 0.43,
                      decoration: const BoxDecoration(
                          color: ColorResources.primary,
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.PADDING_SIZE_LARGE))),
                      duration: const Duration(microseconds: 15000),
                      curve: Curves.easeInSine,
                      child: Text(
                        widget.pageController.page?.ceil() == 5
                            ? "Submit"
                            : "Continue",
                        style: buttonPoppinsTextStyle1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
