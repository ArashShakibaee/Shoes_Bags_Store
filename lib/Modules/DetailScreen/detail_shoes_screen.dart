import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shoes_store/Component/custom_icon.dart';
import 'package:shoes_store/Component/detail_screen_shadow.dart';
import 'package:shoes_store/Component/size_button.dart';
import 'package:shoes_store/Utils/item.dart';
import 'package:shoes_store/Values/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class DetailShoesScreen extends StatefulWidget {
  static const String routeName = 'detail_shoes_screen';
  final BuildItem item;

  const DetailShoesScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<DetailShoesScreen> createState() => _DetailShoesScreenState();
}

class _DetailShoesScreenState extends State<DetailShoesScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 4,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
                child: Hero(
                    tag: widget.item,
                    child:
                        Image.asset(widget.item.urlImage, fit: BoxFit.cover))),
            const SlideAnimation(
              verticalOffset: 300,
              duration: Duration(milliseconds: 500),
              child: FadeInAnimation(
                duration: Duration(milliseconds: 600),
                child: DetailScreenShadow(
                    color: Colors.black,
                    width: double.infinity,
                    height: 300,
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    alignment: Alignment.bottomCenter),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: SlideAnimation(
                  horizontalOffset: 300,
                  duration: const Duration(milliseconds: 600),
                  child: FadeInAnimation(
                    duration: const Duration(milliseconds: 900),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIcon(
                          isButton: true,
                          isGestureDetector: true,
                          assetName:
                              Localizations.localeOf(context).languageCode ==
                                      'fa'
                                  ? 'images/svg/arrow-right.svg'
                                  : 'images/svg/arrow-left.svg',
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SlideAnimation(
                verticalOffset: 300,
                duration: const Duration(milliseconds: 500),
                child: FadeInAnimation(
                  duration: const Duration(milliseconds: 600),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          widget.item.title,
                          style: AppStyle.normalTextStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ),
                      Localizations.localeOf(context).languageCode == 'fa'
                          ? const SizedBox(height: 10)
                          : const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          AppLocalizations.of(context)!.shoeSize,
                          style: AppStyle.normalTextStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: 210,
                        height: 50,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [SizeButton()],
                        ),
                      ),
                      Localizations.localeOf(context).languageCode == 'fa'
                          ? const SizedBox(height: 20)
                          : const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: ElevatedButton(
                            onPressed: () {},
                            child:Text(AppLocalizations.of(context)!.buyButton),
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                primary: Colors.white,
                                onPrimary: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
