import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/categoryCard/categoryCard.dart';
import 'package:pharmacy_app/utils/text.dart';

import '../../utils/colors.dart';

class allCategories extends StatelessWidget {
  var items = [1,2,3,4,5,6,7,8,9];
   allCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.mainBlue,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/');
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
          iconTheme: IconThemeData(
            color: AppColor.mainGray,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: ListView(
          children: [
            Center(
                child: BigText(
              text: 'Shop By Category',
              color: AppColor.thirdBlue,
            )),
            SizedBox(height: 25,),
            GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                // crossAxisSpacing: 5,
                // mainAxisSpacing: 1,
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                children:

                // <--------------- list generated from list called categories --------------->
                List.generate(items.length, (index) {
                  return GestureDetector(
                    onTap: (){},
                    child: CategoryCard(),
                    // Container(
                    //   child: Column(
                    //     children: [
                    //       CircleAvatar(
                    //         radius: 32.0,
                    //         backgroundImage: AssetImage('assets/images/orthopedic.png'),
                    //         backgroundColor: Colors.blue.shade50,
                    //       ),
                    //       SizedBox(
                    //         height: 10,
                    //       ),
                    //       Text(
                    //         'Orthopaedic',
                    //         style: TextStyle(fontWeight: FontWeight.bold),
                    //       ),
                    //     ],
                    //   ),
                    //   margin: EdgeInsets.fromLTRB(6, 20, 6, 4),
                    //   width: 100,
                    //   padding: EdgeInsets.only(top: 10),
                    //   decoration: BoxDecoration(
                    //       color: Colors.white, borderRadius: BorderRadius.circular(7.32)),
                    // ),
                  );
                })),
          ],
        ),
      ),
    );
  }
}
