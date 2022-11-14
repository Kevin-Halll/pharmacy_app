import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/cart/cartCard.dart';
import 'package:pharmacy_app/components/cart/summaryCard.dart';

import '../../custom_widgets/colors.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var item = [1, 2, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.mainBlue,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Ink(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.arrow_back,
                size: 20,
                color: AppColor.mainGrey,
              ),
            ),
          ),
        ),
        body: Container(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${item.length} Items in cart',
                              style: TextStyle(color: AppColor.darkGrey),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/products');
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 14,
                                    color: AppColor.thirdBlue,
                                  ),
                                  Text(
                                    'Add More Items',
                                    style: TextStyle(color: AppColor.thirdBlue),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              height: 330,
                              child: ListView.builder(
                                itemCount: item.length,
                                itemBuilder: (context, index) {
                                  return const CartCard();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Positioned(
                bottom: 0,
                child: SummaryCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
