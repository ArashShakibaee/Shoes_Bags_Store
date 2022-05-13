import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shoes_store/Component/base_container.dart';
import 'package:shoes_store/Modules/DetailScreen/detail_bags_screen.dart';
import 'package:shoes_store/Utils/item.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BagsScreen extends StatefulWidget {
  static const String routeName = 'bags-screen';

  const BagsScreen({Key? key}) : super(key: key);

  @override
  State<BagsScreen> createState() => _BagsScreenState();
}

class _BagsScreenState extends State<BagsScreen> {
  @override
  Widget build(BuildContext context) {
    List<BuildItem> bags = [
      BuildItem(
          urlImage: "images/bag_1.png",
          title: AppLocalizations.of(context)!.handsBag,
          company: AppLocalizations.of(context)!.royal,
          price: "100\$"),
      BuildItem(
          urlImage: "images/bag_2.png",
          title: AppLocalizations.of(context)!.crossBody,
          company: AppLocalizations.of(context)!.gucci,
          price: "100\$"),
      BuildItem(
          urlImage: "images/bag_3.png",
          title: AppLocalizations.of(context)!.bridal,
          company: AppLocalizations.of(context)!.gucci,
          price: "100\$"),
      BuildItem(
          urlImage: "images/bag_4.png",
          title: AppLocalizations.of(context)!.womenCase,
          company: AppLocalizations.of(context)!.royal,
          price: "100\$"),
    ];
    return AnimationConfiguration.staggeredList(
      position: 4,
      child: Scaffold(
        body: SlideAnimation(
          duration: const Duration(milliseconds: 500),
          child: FadeInAnimation(
            child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: bags.length,
                itemBuilder: (context, index) {
                  final bag = bags[index];
                  return Hero(
                    tag: bag,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailBagsScreen(item: bag)));
                      },
                      child: BaseContainer(
                        image: bag.urlImage,
                        title: bag.title,
                        company: bag.company,
                        price: bag.price,
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
