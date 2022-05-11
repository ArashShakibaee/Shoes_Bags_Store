import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes_store/Component/custom_dialog.dart';
import 'package:shoes_store/Component/custom_icon.dart';
import 'package:shoes_store/Modules/SplashScreen/UI/splash_screen.dart';
import 'package:shoes_store/Utils/shared_preference.dart';
import 'package:shoes_store/Values/app_colors.dart';
import 'package:shoes_store/Values/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class DrawerScreen extends StatefulWidget {
  static const String routeName = 'drawer-screen';

  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String? email;
  String? username;

  BorderRadius getBorderRadiusOfMainDrawer() {
    if (Localizations.localeOf(context).languageCode == 'fa') {
      return const BorderRadius.only(topLeft: Radius.circular(150));
    } else {
      return const BorderRadius.only(topRight: Radius.circular(150));
    }
  }

  BorderRadius getBorderRadiusOfUserAccount() {
    if (Localizations.localeOf(context).languageCode == 'fa') {
      return const BorderRadius.only(topLeft: Radius.circular(119));
    } else {
      return const BorderRadius.only(topRight: Radius.circular(119));
    }
  }

  Future<void> getLocalData() async {
    username = await PrefManager.getUsername();
    email = await PrefManager.getEmailAddress();
    setState(() {});
  }

  @override
  void initState() {
    getLocalData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.teal,
      shape:
          RoundedRectangleBorder(borderRadius: getBorderRadiusOfMainDrawer()),
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text(
              email ?? "Email Address",
              style: AppStyle.normalTextStyle,
            ),
            accountName: Text(
                username?.toUpperCase() ?? "Username".toUpperCase(),
                style: AppStyle.normalTextStyle.copyWith(fontWeight: FontWeight.bold)),
            decoration: BoxDecoration(
                color: AppColor.grey,
                borderRadius: getBorderRadiusOfUserAccount()),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('images/meee.png'),
            ),
          ),
          CustomDrawerTile(
              onTab: () {},
              text: AppLocalizations.of(context)!.profile,
              imageAsset: 'images/svg/profile.svg'),
          Divider(
            color: AppColor.lightGrey,
            indent: 32,
            endIndent: 32,
          ),
          CustomDrawerTile(
              onTab: () {},
              text: AppLocalizations.of(context)!.shoesCategory,
              imageAsset: 'images/svg/shoe.svg'),
          Divider(
            color: AppColor.lightGrey,
            indent: 32,
            endIndent: 32,
          ),
          CustomDrawerTile(
              onTab: () {},
              text: AppLocalizations.of(context)!.bagsCategory,
              imageAsset: 'images/svg/briefcase.svg'),
          Divider(
            color: AppColor.lightGrey,
            indent: 32,
            endIndent: 32,
          ),
          CustomDrawerTile(
              onTab: () {},
              text: AppLocalizations.of(context)!.cart,
              imageAsset: 'images/svg/cart.svg'),
          Divider(
            color: AppColor.lightGrey,
            indent: 32,
            endIndent: 32,
          ),
          CustomDrawerTile(
              onTab: () {},
              text: AppLocalizations.of(context)!.favorite,
              imageAsset: 'images/svg/heart.svg'),
          Divider(
            color: AppColor.lightGrey,
            indent: 32,
            endIndent: 32,
          ),
          CustomDrawerTile(
              onTab: () {},
              text: AppLocalizations.of(context)!.setting,
              imageAsset: 'images/svg/spark.svg'),
          Divider(
            color: AppColor.lightGrey,
            indent: 32,
            endIndent: 32,
          ),
          CustomDrawerTile(
              onTab: _handleLogoutButton,
              text: AppLocalizations.of(context)!.logout,
              imageAsset: 'images/svg/arrow-point.svg')
        ],
      ),
    );
  }

  void _handleLogoutButton() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    CustomDialog.show(
        context: context,
        onTapConfirmed: () {
          preferences.remove('emailAddress');
          preferences.remove('username');
          Navigator.pushReplacementNamed(context, SplashScreen.routeName);
        },
        title: AppLocalizations.of(context)!.logoutAlertDialogTitle,
        content: AppLocalizations.of(context)!.logoutAlertDialogContent,
        yesButtonText: AppLocalizations.of(context)!.yes.toUpperCase(),
        noButtonText: AppLocalizations.of(context)!.no.toUpperCase()
    );
  }
}

class CustomDrawerTile extends StatelessWidget {
  final String text;
  final String imageAsset;
  final VoidCallback onTab;

  const CustomDrawerTile(
      {Key? key,
      required this.onTab,
      required this.text,
      required this.imageAsset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTab,
        title: Text(text,
            style: AppStyle.normalTextStyle.copyWith(color: AppColor.deepGrey)),
        leading: CustomIcon(
          isButton: false,
          isGestureDetector: false,
          assetName: imageAsset,
          height: 35,
          color: AppColor.deepGrey,
          width: 35,
        ));
  }
}
