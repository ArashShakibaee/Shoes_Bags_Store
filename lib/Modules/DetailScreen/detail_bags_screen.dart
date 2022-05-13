import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shoes_store/Component/custom_icon.dart';
import 'package:shoes_store/Utils/item.dart';
import 'package:shoes_store/Values/app_colors.dart';
import 'package:shoes_store/Values/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class DetailBagsScreen extends StatefulWidget {
  static const String routeName = 'detail_bags_screen';
  final BuildItem item;

  const DetailBagsScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<DetailBagsScreen> createState() => _DetailBagsScreenState();
}

class _DetailBagsScreenState extends State<DetailBagsScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 4,
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Stack(
          children: [
            Hero(
                tag: widget.item,
                child: Image.asset(widget.item.urlImage,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width)),
            Positioned.fill(
              child: Column(children: [
                Expanded(flex: 4, child: Container()),
                Expanded(
                    flex: 3,
                    child: SlideAnimation(
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.lightGrey,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            )),
                        child: SlideAnimation(
                            duration: const Duration(milliseconds: 500),
                            child: FadeInAnimation(
                                duration: const Duration(milliseconds: 650),
                                child: buildDescription())),
                      ),
                    )),
                Expanded(
                    child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.price,
                        style: AppStyle.normalTextStyle.copyWith(
                            fontSize:
                                Localizations.localeOf(context).languageCode ==
                                        'fa'
                                    ? 30
                                    : 40),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: AppColor.teal,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10)),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(AppLocalizations.of(context)!.buyButton),
                                CustomIcon(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    isButton: false,
                                    isGestureDetector: false,
                                    color: Colors.white,
                                    assetName: 'images/svg/cart.svg')
                              ],
                            )),
                      ),
                    ],
                  ),
                )),
              ]),
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
          ],
        ),
      ),
    );
  }

  Widget buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 45),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.titleDescription,
              style: AppStyle.dashboardTextStyle
                  .copyWith(color: Colors.grey[600])),

          Localizations.localeOf(context).languageCode == 'fa'
              ? const SizedBox(height: 5)
              : const SizedBox(height: 15),
          Text(
            AppLocalizations.of(context)!.bodyDescription,
            style: AppStyle.normalTextStyle.copyWith(color: Colors.grey),
          ),

          Localizations.localeOf(context).languageCode == 'fa'
              ? const SizedBox(height: 20)
              : const SizedBox(height: 30),
          Text(AppLocalizations.of(context)!.quantity,
              style: AppStyle.dashboardTextStyle
                  .copyWith(color: Colors.grey[600])),

          Localizations.localeOf(context).languageCode == 'fa'
              ? const SizedBox(height: 5)
              : const SizedBox(height: 15),
          Padding(
            padding: Localizations.localeOf(context).languageCode == 'fa'
                ? const EdgeInsets.only(left: 230)
                : const EdgeInsets.only(right: 230),
            child: SizedBox(
              height: 43,
              child: Card(
                color: Colors.grey[200],
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side:BorderSide(color: Colors.grey.shade400)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(onTap: (){}, child: const Icon(Icons.add , color: Colors.grey,)),
                      Container(
                        width: 1,
                        height: 43,
                        color: Colors.grey.shade400,
                      ),
                      InkWell(onTap: (){}, child: const Icon(Icons.remove ,color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
