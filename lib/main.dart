import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shoes_store/Modules/Authentication/UI/login_screen.dart';
import 'package:shoes_store/Modules/Drawer/Main/drawer_screen.dart';
import 'package:shoes_store/Modules/Home/Pages/bags_screen.dart';
import 'package:shoes_store/Modules/Home/Pages/dashboard_screen.dart';
import 'package:shoes_store/Modules/Home/Pages/shoes_screen.dart';
import 'package:shoes_store/Modules/SplashScreen/UI/splash_screen.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'L10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(
     SystemUiOverlayStyle(
        systemNavigationBarDividerColor: Colors.grey.shade200,
        systemNavigationBarColor: Colors.grey.shade200,
       systemNavigationBarIconBrightness: Brightness.dark
    ),
  );
  runApp(const Store());
}

class Store extends StatelessWidget {
  const Store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: PersianFonts.vazirTextTheme,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (context) => const SplashScreen(),
        BagsScreen.routeName : (context) => const BagsScreen(),
        ShoesScreen.routeName : (context) => const ShoesScreen(),
        AuthenticationScreen.routeName : (context) => const AuthenticationScreen(),
        DrawerScreen.routeName : (context) => const DrawerScreen(),
        DashboardScreen.routeName : (context) => const DashboardScreen(),
      },
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
    );
  }
}
