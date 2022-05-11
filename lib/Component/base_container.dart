import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shoes_store/Component/card_shadow.dart';
import 'package:shoes_store/Values/app_styles.dart';

class BaseContainer extends StatelessWidget {
  final String image;
  final String title;
  final String company;
  final String price;

  const BaseContainer({
    Key? key,
    required this.image,
    required this.title,
    required this.company,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 4,
      child:Container(
          width: MediaQuery.of(context).size.width*0.9,
          height: 250,
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 10),
                  blurRadius: 10,
                )
              ]),
          child: Stack(children: [
            const Positioned.fill(
                child: CardShadow(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                    topLeft: Radius.circular(20))),
            const Positioned.fill(
                child: CardShadow(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    topRight: Radius.zero,
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.zero)),
            const Positioned.fill(
                child: CardShadow(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                    topLeft: Radius.circular(20))),
            const Positioned.fill(
                child: CardShadow(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    topRight: Radius.zero,
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.zero)),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SlideAnimation(
                duration: const Duration(milliseconds: 400),
                verticalOffset: 50,
                child: FadeInAnimation(
                  duration: const Duration(milliseconds: 700),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: AppStyle.normalTextStyle.copyWith(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
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
                      Text(company,
                          style: AppStyle.normalTextStyle.copyWith(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 95,
                      ),
                      Text(price,
                          style: AppStyle.normalTextStyle.copyWith(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
    );
  }
}
