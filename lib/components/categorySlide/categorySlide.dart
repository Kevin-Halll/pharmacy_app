import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/categoryCard/categoryCard.dart';
import 'package:pharmacy_app/utils/colors.dart';


class CategorySlide extends StatelessWidget {
  const CategorySlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: AppColor.mainBlue,
            borderRadius: BorderRadius.circular(7.32)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Shop by Category',
                    style: TextStyle(
                        color: Color.fromARGB(156, 32, 32, 32),
                        fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/categories');
                  },
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/all-categories');
                    },
                    child:  Row(
                      children: [
                        Text(
                          'SEE ALL',
                          style: TextStyle(
                              color: AppColor.thirdBlue,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_forward, size: 15, color: AppColor.thirdBlue,)
                      ],
                    ),
                  )
                )
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [_categories()],
            // )
            SizedBox(
              height: 170,
              child: ListView.builder(

                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryCard();
                  }),
            ),
          ],
        ));
  }
}

