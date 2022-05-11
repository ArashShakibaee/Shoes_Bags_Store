import 'package:flutter/material.dart';
import 'package:shoes_store/Values/app_colors.dart';
import 'package:shoes_store/Values/app_styles.dart';

class CustomDialog extends StatelessWidget {
  final VoidCallback onTapConfirmed;
  final String content;
  final String title;
  final String yesButtonText;
  final String noButtonText;
  final BuildContext context;

  const CustomDialog(
      {Key? key,
      required this.onTapConfirmed,
      required this.title,
      required this.content,
      required this.noButtonText,
      required this.context,
      required this.yesButtonText})
      : super(key: key);

  static void show({
    required BuildContext context,
    bool isDismissible = false,
    required Function() onTapConfirmed,
    required String title,
    required String content,
    required String yesButtonText,
    required String noButtonText,
  }) {
    showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (context) => CustomDialog(
        context: context,
        noButtonText: noButtonText,
        yesButtonText: yesButtonText,
        onTapConfirmed: onTapConfirmed,
        content: content,
        title: title,
      ),
    );
  }
  BorderRadius getBorderRadiusOfAlertDialog() {
    if (Localizations.localeOf(context).languageCode == 'fa') {
      return const BorderRadius.only(topLeft: Radius.circular(100),bottomRight: Radius.circular(100) );
    } else {
      return const BorderRadius.only(topRight: Radius.circular(100),bottomLeft: Radius.circular(100));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.lightGrey,
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: getBorderRadiusOfAlertDialog(),
          side: BorderSide(color: AppColor.teal, width: 2)),
      title: Text(
        title,
        style: AppStyle.dashboardTextStyle,
      ),
      content: Text(
        content,
        style: AppStyle.normalTextStyle.copyWith(fontSize: 15),
      ),
      actions: [
        TextButton(
            onPressed: () => onTapConfirmed.call(),
            child: Text(
              yesButtonText,
              style: AppStyle.normalTextStyle
                  .copyWith(color: AppColor.teal, fontSize: 13),
            )),
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              noButtonText,
              style: AppStyle.normalTextStyle
                  .copyWith(color: Colors.red, fontSize: 13),
            )),
      ],
    );
  }
}
