import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/categorySlide/categorySlide.dart';
import 'package:pharmacy_app/components/searchBar/searchBar.dart';
import 'package:pharmacy_app/utils/text.dart';

import '../../utils/colors.dart';
import '../productCard/productCard.dart';

class ProductsPage extends StatelessWidget {
  var item = [1,2,3,4,5,6,7,8,9,];
   ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back,)),
          iconTheme: IconThemeData(color: AppColor.mainGray,),
          titleSpacing: 10,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          // title: Center(
          //     child: Text('Hello Kevin', style: TextStyle(color: Colors.blueGrey, fontSize: 14),)
          //   // BigText(text: 'Hello Kevin', color: AppColor.thirdBlue,)
          // ),
          actions: [
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/cart');
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        color: AppColor.mainBlue,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(Icons.shopping_cart, color: AppColor.mainGray,),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SearchBar(),
                CategorySlide(),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: 'Item Category', color: AppColor.thirdBlue,),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
