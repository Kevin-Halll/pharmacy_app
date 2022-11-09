import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/productCard/productCard.dart';

import '../../custom_widgets/colors.dart';
import '../../custom_widgets/text.dart';

class Offers extends StatelessWidget {
  var item = [
    1,
    2,
    3,
    4,
    5,
  ];
  Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: "Special Offers",
            color: AppColor.thirdBlue,
          ),
          GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              children:

                  // <--------------- list generated from list called categories --------------->
                  List.generate(item.length, (index) {
                return ProductCard();
              }))
        ],
      ),
    );
  }
}
