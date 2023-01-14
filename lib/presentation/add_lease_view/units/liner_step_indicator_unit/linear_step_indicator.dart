import 'package:add_lease/app/core/utils/color_resources.dart';
import 'package:add_lease/app/core/utils/dimensions.dart';
import 'package:add_lease/app/core/utils/extensions.dart';
import 'package:add_lease/app/core/utils/media_query_values.dart';
import 'package:add_lease/presentation/add_lease_view/units/liner_step_indicator_unit/node.dart';
import 'package:flutter/material.dart';

typedef Complete = Future<bool> Function();

class LinearStepIndicator extends StatefulWidget {

  final PageController controller;
  final bool passPage;
  final int steps;
  final double nodeSize;
  final double lineHeight;
  final double nodeThickness;
  final Color iconColor;
  final Color backgroundColor;
  final Complete? complete;
  final double verticalPadding;
  final List<String> labels;

  const LinearStepIndicator({
    Key? key,
    required this.steps,
    required this.controller,
    this.nodeThickness = 3,
    this.nodeSize = 35,
    this.verticalPadding = 10,
    this.lineHeight = 3,
    this.iconColor = ColorResources.checkGreenColor,
    this.backgroundColor = ColorResources.primary,
    this.complete,
    this.passPage = false,
    this.labels = const <String>[],
  })  : assert(steps > 0, "steps value must be a non-zero positive integer"),
        assert(labels.length == steps || labels.length == 0,
            "Provide exactly $steps strings for labels"),
        super(key: key);

  @override
  LinearStepIndicatorState createState() => LinearStepIndicatorState();
}

class LinearStepIndicatorState extends State<LinearStepIndicator> {
  late List<Node> nodes;
  late int lastStep;

  @override
  void initState() {
    super.initState();
    nodes = List<Node>.generate(widget.steps, (index) => Node(step: index));
    lastStep = 0;


    widget.controller.addListener(
      () async {
        if (widget.controller.page!.ceil() > lastStep) {
          setState(
            () {
              nodes[lastStep].completed = true;
              lastStep = widget.controller.page!.ceil();
            },
          );
        }
        if (widget.controller.page!.ceil() < lastStep) {
          setState(
            () {
              lastStep--;
              nodes[lastStep].completed = false;
              lastStep = widget.controller.page!.ceil();
            },
          );
        }


        //checks if the controller has hit the max
        if (widget.controller.page!.ceil() == widget.steps - 1 &&
            widget.complete != null) {
          if (await widget.complete!()) {
            nodes[widget.steps - 1].completed = true;
            setState(() {});
          }else{
            nodes[widget.steps - 1].completed = false;
            setState(() {});
          }
        }
      },
    );
  }

  //returns active or inactive color depending on the completion status of [node]
  Color getColor(Node node) {
    if (node.completed || lastStep == node.step) {
      return ColorResources.selectGreenColor;
    }else{
      return ColorResources.whiteColor;

    }
  }

  BorderSide side(Node node) => BorderSide(
        color: getColor(node),
        width: widget.nodeThickness,
      );

  TextStyle getTextStyle(String label) {
    var currentIndex = widget.labels.indexOf(label);
    if (nodes[currentIndex].completed || currentIndex == lastStep) {
      //return active text style
      return const TextStyle(
          fontSize: 10, color: ColorResources.selectGreenColor);
    } else {
      //return inactive text style
      return const TextStyle(fontSize: 10, color: ColorResources.whiteColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      color: ColorResources.primary,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var node in nodes) ...[
                    Container(
                      alignment: Alignment.center,
                      height: widget.nodeSize,
                      width: widget.nodeSize,
                      decoration: BoxDecoration(
                        color: !node.completed
                            ? ColorResources.primary
                            :
                            // :  !node.fail ?
                            ColorResources.selectGreenColor,
                        // : ColorResources.failBackgroundColor,
                        border: Border(
                          bottom: side(node),
                          top: side(node),
                          left: side(node),
                          right: side(node),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child:
                          // node.fail
                          //     ? SvgPicture.asset(
                          //   Images.failIcon,
                          // )
                          //     :
                          node.completed
                              ? const Icon(
                                  Icons.check_circle,
                                  size: 20,
                                  color: ColorResources.checkGreenColor,
                                )
                              : null,
                    ),
                    if (node.step != widget.steps - 1)
                      Container(
                          color: node.completed
                              ? ColorResources.selectGreenColor
                              : ColorResources.lightPrimary,
                          height: node.completed ? 3 : 1.5,
                          width: context.screenWidth(1 / widget.steps) -
                              widget.nodeSize),
                  ],
                ],
              ),
              const SizedBox(height: 8),
              if (widget.labels.isNotEmpty) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var label in widget.labels) ...[
                      SizedBox(
                        width: widget.nodeSize * 1.30,
                        child: Text(
                          label,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: getTextStyle(label),
                        ),
                      ),
                      if (label != widget.labels[widget.steps - 1]) ...[
                        SizedBox(
                          width: context.screenWidth(1 / widget.steps) -
                              widget.nodeSize * 1.30,
                        ),
                      ],
                    ],
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
