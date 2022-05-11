import 'package:flutter/material.dart';

class DetailScreenShadow extends StatelessWidget {
  final double width;
  final double height;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final AlignmentGeometry alignment;
  final Radius? radiusTopRight;
  final Radius? radiusTopLeft;
  final Radius? radiusBottomRight;
  final Radius? radiusBottomLeft;
  final Color color;

  const DetailScreenShadow(
      {Key? key,
      required this.width,
      required this.height,
      required this.begin,
      required this.end,
      required this.alignment,
      required this.color,
      this.radiusBottomLeft,
      this.radiusBottomRight,
      this.radiusTopLeft,
      this.radiusTopRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: radiusTopRight ?? Radius.zero,
              topLeft: radiusTopLeft ?? Radius.zero,
              bottomRight: radiusBottomRight ?? Radius.zero,
              bottomLeft: radiusBottomLeft ?? Radius.zero),
          gradient: LinearGradient(colors:  [
            color,
            Colors.transparent
          ], begin: begin, end: end),
        ),
      ),
    );
  }
}
