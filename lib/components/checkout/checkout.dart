import 'package:flutter/material.dart';
import 'package:pharmacy_app/custom_widgets/text.dart';

import '../../custom_widgets/colors.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColor.mainBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Ink(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(Icons.arrow_back, size: 20, color: AppColor.mainGrey,),
          ),
        ),
        title: XLText(text: "Checkout", color: AppColor.darkGrey,),
        centerTitle: true,
      ),

      body: ListView(
        children: [
          SizedBox(height: 30,),
          Center(
            child: Container(
              width: 320,
              height: 180,
              decoration: BoxDecoration(
                color: AppColor.secondBlue,
                borderRadius: BorderRadius.circular(10),
                // image: const DecorationImage(image: AssetImage("assets/images/credit_card.png"),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                    ),
                    child: Text("XXXX XXXX XXXX XXXX", style: TextStyle(color: Colors.white, fontSize: 20),),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    ));
  }
}
