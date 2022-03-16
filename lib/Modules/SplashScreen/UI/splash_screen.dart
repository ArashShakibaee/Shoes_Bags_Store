import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:shoes_store/Modules/Home/Pages/dashboard_screen.dart';
import 'package:shoes_store/Values/app_colors.dart';
import 'package:shoes_store/Values/app_styles.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash-screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
   late AnimationController _controller;
   late Animation animation;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){Navigator.pushReplacementNamed(context, DashboardScreen.routeName);});

    _controller = AnimationController(duration: const Duration(seconds: 1),vsync: this);
    animation = ColorTween(begin: Colors.blueGrey , end: Colors.white).animate(_controller);
    _controller.forward();
    _controller.addListener(() {setState(() {});});

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: LoadingAnimationWidget.hexagonDots(
                  color: AppColor.teal, size: 40),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: Text(
                    AppLocalizations.of(context)!.welcomeText,
                    style: AppStyle.welcomeTextStyle,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
