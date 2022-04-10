import 'package:flutter/material.dart';
import 'package:shoes_store/Values/app_colors.dart';

class AppStyle {
  static TextStyle normalTextStyle =
      TextStyle(color: AppColor.deepGrey, fontFamily: 'Source');

  static TextStyle welcomeTextStyle = TextStyle(
      color: AppColor.deepGrey,
      fontFamily: 'Source',
      fontSize: 18,
      fontWeight: FontWeight.bold);
  static TextStyle dashboardTextStyle = TextStyle(
      color: AppColor.teal,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      fontFamily: 'Source');
  static const TextStyle tabBarTextStyle = TextStyle(
      fontSize: 17.0, fontWeight: FontWeight.bold, fontFamily: 'Source');
  static const TextStyle qHaveAccount = TextStyle(fontSize: 14);
}
