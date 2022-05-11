
import 'package:flutter/material.dart';
import 'package:shoes_store/Values/app_styles.dart';

class SizeButton extends StatefulWidget {
  SizeButton({Key? key}) : super(key: key);

  @override
  State<SizeButton> createState() => _SizeButtonState();
}

class _SizeButtonState extends State<SizeButton> {
  final List<int> _sizeOfShoes = [38, 39, 40, 41, 42, 44, 46];

  int itemSelected = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _sizeOfShoes.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              itemSelected = index;
            });
          },
          child: Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                    color: itemSelected == index
                        ? Colors.white
                        : null,
                borderRadius: BorderRadius.circular(8)
                ),
                child: Center(
                  child: Text(
                    _sizeOfShoes[index].toString(),
                    style: AppStyle.normalTextStyle
                        .copyWith(fontSize: 18, fontWeight: FontWeight.bold,color: itemSelected == index ? Colors.black :Colors.white),
                  ),
                ),
              ),
        ));
  }
}
