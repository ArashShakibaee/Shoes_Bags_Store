import 'package:flutter/material.dart';

class CardShadow extends StatelessWidget {
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final Radius topLeft;
  final Radius topRight;
  final Radius  bottomLeft;
  final Radius  bottomRight;
  const CardShadow(
      {Key? key,
      required this.end,
      required this.begin,
      required this.topRight,
      required this.bottomLeft,
      required this.bottomRight,
      required this.topLeft,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: bottomLeft ,
            bottomRight: bottomRight,
            topLeft: topLeft,
            topRight: topRight
          ),
          gradient: LinearGradient(colors: const [
            Colors.black12,
            Colors.transparent,
          ], begin: begin, end: end)),
    );
  }
}
