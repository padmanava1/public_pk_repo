import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomWidget extends StatelessWidget {

  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const CustomWidget.rectangular({
    this.width = double.infinity,
    required this.height
  }): this.shapeBorder = const RoundedRectangleBorder();

  const CustomWidget.circular({
    this.width = double.infinity,
    required this.height,
    this.shapeBorder = const CircleBorder()
  });

  const CustomWidget.square({
     this.width = 45,
      this.height = 45,

    this.shapeBorder = const RoundedRectangleBorder()
  });

  @override
  Widget build(BuildContext context)  => Shimmer.fromColors(
    baseColor: Colors.grey,
    highlightColor: Colors.grey[300]!,
    period: Duration(seconds: 2),
    child: Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: Colors.grey[50]!,
        shape: shapeBorder,

      ),
    ),
  );
}