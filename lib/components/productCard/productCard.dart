import 'package:flutter/material.dart';
import 'package:pharmacy_app/utils/colors.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/details');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: AppColor.mainBlue,
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              // width: 130,
                height: 110,
                child: Image.asset(
                  'assets/images/panadol.png',
                  // 'assets/images/opened-bottle-of-pills.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
                )),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Panadol 500mg',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$500",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: AppColor.thirdBlue)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          size: 20,
                          color: AppColor.thirdBlue,
                        ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
