import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  EdgeInsetsGeometry? padding ;
  final bool isButton;
  final bool isGestureDetector;
  final VoidCallback? onPressed;
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;

  CustomIcon(
      {Key? key,
      this.onPressed,
      this.padding,
      required this.isButton,
      required this.isGestureDetector,
      required this.assetName,
      this.height,
      this.width,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding!,
        child: isButton
            ? isGestureDetector
                ? GestureDetector(
                    onTap: onPressed,
                    child: SvgPicture.asset(
                      assetName,
                      height: height,
                      width: width,
                      color: color,
                    ),
                  )
                : IconButton(
                    onPressed: onPressed,
                    icon: SvgPicture.asset(
                      assetName,
                      height: height,
                      width: width,
                      color: color,
                    ))
            : SvgPicture.asset(
                assetName,
                height: height,
                width: width,
                color: color,
              ));
  }
}
