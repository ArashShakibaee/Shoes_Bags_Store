import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:shoes_store/Component/custom_icon.dart';
import 'package:shoes_store/Modules/Drawer/Main/drawer_screen.dart';
import 'package:shoes_store/Modules/Home/Pages/bags_screen.dart';
import 'package:shoes_store/Modules/Home/Pages/shoes_screen.dart';
import 'package:shoes_store/Values/app_colors.dart';
import 'package:shoes_store/Values/app_styles.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = 'dashboard-screen';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.lightGrey,
        drawer: const DrawerScreen(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.lightGrey,
          title: Text(
            AppLocalizations.of(context)!.dashboardText.toUpperCase(),
            style: AppStyle.dashboardTextStyle,
          ),
          leading: Builder(builder: (BuildContext context) {
            return CustomIcon(
              isButton: true,
              isGestureDetector: false,
              assetName: 'images/svg/menu.svg',
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              height: 30,
              width: 30,
              color: AppColor.teal,
              padding: EdgeInsets.zero,
            );
          }),
          centerTitle: true,
          actions: [
            CustomIcon(
              onPressed: (){},
              isButton: true,
              isGestureDetector: false,
              assetName: 'images/svg/cart.svg',
              padding: EdgeInsets.zero,
              color: AppColor.teal,
            )
          ],
          bottom: TabBar(
            enableFeedback: false,
            indicatorWeight: 4,
            labelStyle: AppStyle.tabBarTextStyle,
            indicatorColor: AppColor.teal,
            labelColor: AppColor.teal,
            unselectedLabelColor: AppColor.grey,
            tabs: <Widget>[
              Tab(text: AppLocalizations.of(context)!.shoeText.toUpperCase()),
              Tab(text: AppLocalizations.of(context)!.bagText.toUpperCase()),
            ],
          ),
        ),
        body: const TabBarView(children: [ShoesScreen(),BagsScreen()]),
      ),
    );
  }
}