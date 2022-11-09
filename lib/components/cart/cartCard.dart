import 'package:flutter/material.dart';
import 'package:pharmacy_app/utils/colors.dart';
import 'package:pharmacy_app/utils/text.dart';

class CartCard extends StatefulWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
        height: 100,
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Stack(
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    SizedBox(
                        width: 70,
                        child: Image.asset('assets/images/panadol.png')),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(text: 'Panadol 500mg'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(text: '\$500.00', color: AppColor.thirdBlue,),
                              // SizedBox(width: 70,),s
                              Container(
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: _decrementCounter,
                                        icon: Icon(Icons.remove_circle_rounded,
                                            size: 20,
                                            color: Colors.white,
                                            shadows: <Shadow>[
                                              Shadow(
                                                  color: Colors.grey.shade600,
                                                  offset: Offset.fromDirection(-22, -1),
                                                  blurRadius: 5.0)
                                            ]),
                                        // color: Colors.cyan,
                                      ),
                                      Text('$_counter'),
                                      IconButton(
                                        onPressed: _incrementCounter,
                                        icon: Icon(Icons.add_circle_rounded,
                                            size: 20,
                                            color: Colors.white,
                                            shadows: <Shadow>[
                                              Shadow(
                                                  color: Colors.grey.shade600,
                                                  offset: Offset.fromDirection(22, 1),
                                                  blurRadius: 5.0)
                                            ]),
                                        // color: Colors.cyan,
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Ink(
                // padding: EdgeInsets.all(2),
                width: 30,
                height: 30,
                // decoration: BoxDecoration(
                //     color: AppColor.secondBlue,
                //     borderRadius: BorderRadius.circular(5),
                //     border: Border.all(color: Colors.black, style: BorderStyle.solid)
                // ),
                child: GestureDetector(
                  onTap: (){
                    print('hello');
                  },
                    child: Center(
                        child: Icon(
                  Icons.close,
                  size: 20,
                  color: AppColor.mainGray,
                ))),
              ),
            ),
          ],
        ));
  }
}
