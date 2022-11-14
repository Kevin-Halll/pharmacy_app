import 'package:flutter/material.dart';

import '../../custom_widgets/colors.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _amount = 1;
  double _price = 20.50;
  // bool _ifPriscribed = true;
  String _productType = 'Drug';
  String _productName = 'Vitamin C';
  String _productDescription =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.mainBlue,
        //<------------ start of appbar section ------------>
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Ink(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.arrow_back),
            ),
          ),
          iconTheme: IconThemeData(
            color: AppColor.mainGrey,
          ),
          titleSpacing: 10,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/cart');
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.shopping_cart,
                      color: AppColor.mainGrey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        //<------------ end of appbar section ------------>

        body: SingleChildScrollView(
          child: Column(children: [
            //<------------ section containing image ------------>
            Container(
                height: 264,
                width: double.infinity,
                decoration:
                    BoxDecoration(color: Color.fromRGBO(231, 241, 248, 10)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Image.asset('assets/images/panadol.png'),
                  // child: Image.network(
                  //     'https://s3-alpha-sig.figma.com/img/a7d4/5c26/c79b144e95cb5292e86e071882ff90ed?Expires=1665964800&Signature=Q-uIv7zFRWFCHgbrWK6-BZ1gd2YNE6fyU82A9EuxrC2m5lJCDOjeyazCAVJCuDY59bdG2R51as2VUFmIZbBTidz130FuwFXHQBAbe3gNGBc3VtFQD00SeEv4lA3WbX7kedFXo6cB0thUy7AhWN9IpKX0tnsybzYrEumReFn3WyhGOehbMLtwgM~3myFv0LeV5H8h1o-c1o79CcXLUrEV9wsCYVlGhwsU1upMX2K29So6DFPy5mpeRfqC0BmjU6fQgVnZm2~yi4E9k42WJNhha02k9DywwY8FH89N8Vnv9sZVosiKBRzWHd8q6lBE~ygjH1UbDY4bNFM5NFVcG4tShA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
                )),

            //<------------ section with product details ------------>
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //<------------ product name ------------>
                  Text(
                    '$_productName',
                    style: const TextStyle(
                        color: Color.fromRGBO(56, 55, 55, 10),
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),

                  //<------------ product type ------------>
                  Text(
                    '$_productType',
                    style: const TextStyle(
                        color: Color.fromRGBO(121, 116, 116, 10), fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //<------------ product prescribed or not, boolean value to be implemented ------------>
                  const Text(
                    'Priscription Required',
                    style: TextStyle(fontSize: 14),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //<------------ product price ------------>
                      Text(
                        '\$ $_price',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          //<------------ decrease number of items ------------>
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (_amount <= 1) {
                                  _amount = 1;
                                }
                                _amount--;
                              });
                            },
                            icon: Ink(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.32),
                                  border: Border.all(color: Colors.black)),
                              height: 24,
                              width: 24,
                              child: const Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          //<------------ display of number of items ------------>
                          Text('$_amount'),

                          //<------------ increase number of items ------------>
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _amount++;
                              });
                            },
                            icon: Ink(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.32),
                                  border: Border.all(color: Colors.black)),
                              height: 24,
                              width: 24,
                              child: const Icon(
                                Icons.add,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //<------------ checkout button ------------>
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(27, 117, 188, 10),
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24))
                        // NEW
                        ),
                    onPressed: () {},
                    child: const Text(
                      'Add to Cart',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //<------------ discription of product ------------>
                  Text(
                    '$_productDescription',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(65, 65, 65, 1)),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
