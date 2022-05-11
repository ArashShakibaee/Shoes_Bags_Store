import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shoes_store/Component/base_container.dart';
import 'package:shoes_store/Modules/DetailScreen/detail_shoes_screen.dart';
import 'package:shoes_store/Utils/item.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ShoesScreen extends StatefulWidget {
  static const String routeName = 'shoes-screen';

  const ShoesScreen({Key? key}) : super(key: key);

  @override
  State<ShoesScreen> createState() => _ShoesScreenState();
}

class _ShoesScreenState extends State<ShoesScreen> {
  @override
  Widget build(BuildContext context) {
    List<BuildItem> shoes = [
      BuildItem(
          urlImage: "images/shoe_1.png",
          title: AppLocalizations.of(context)!.sneaker,
          company: AppLocalizations.of(context)!.nike,
          price: "100\$"),
      BuildItem(
          urlImage: "images/shoe_2.png",
          title: AppLocalizations.of(context)!.sneaker,
          company: AppLocalizations.of(context)!.nike,
          price: "100\$"),
      BuildItem(
          urlImage: "images/shoe_3.png",
          title: AppLocalizations.of(context)!.sneaker,
          company: AppLocalizations.of(context)!.nike,
          price: "100\$"),
      BuildItem(
          urlImage: "images/shoe_4.png",
          title: AppLocalizations.of(context)!.sneaker,
          company: AppLocalizations.of(context)!.nike,
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
                itemCount: shoes.length,
                itemBuilder: (context, index) {
                  final shoe = shoes[index];
                  return Hero(
                    tag: shoe,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailShoesScreen(item: shoe)));
                      },
                      child: BaseContainer(
                        image: shoe.urlImage,
                        title: shoe.title,
                        company: shoe.company,
                        price: shoe.price,
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
