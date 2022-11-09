import 'package:flutter/material.dart';
import 'package:pharmacy_app/utils/colors.dart';

import '../../utils/text.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            // border: Border.all(color: Colors.grey, style: BorderStyle.solid),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(child: BigText(text: 'Payment Summary')),
                Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 2, horizontal: 0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1,color: Colors.grey),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              MediumText(text: 'Sub Total'),
                              MediumText(text: '\$1088'),
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8, horizontal: 0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1,color: Colors.grey),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              MediumText(text: 'Tax'),
                              MediumText(text: '15%'),
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8, horizontal: 0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              MediumText(text: 'Total'),
                              MediumText(text: '\$1950.00'),
                            ],
                          ),
                        ),
                      ],
                    )),
                // SizedBox(
                //     width: 350,
                //     height: 50,
                //     child: TextButton(
                //         child: BigText(text: 'CHECHOUT', color: Colors.white,),
                //         style: ButtonStyle(
                //             padding:
                //             MaterialStateProperty.all<EdgeInsets>(
                //                 EdgeInsets.all(15)),
                //             backgroundColor:
                //             MaterialStateProperty.all<Color>(
                //                 AppColor.secondBlue),
                //             // foregroundColor: MaterialStateProperty.all<Color>(
                //             //     Colors.blue.shade900),
                //             shape: MaterialStateProperty.all<
                //                 RoundedRectangleBorder>(
                //                 RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(25.0),
                //                   // side: BorderSide(color: Colors.red)
                //                 ))),
                //         onPressed: () => null)),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextButton(onPressed: (){},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColor.secondBlue),
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 20)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                )
                            )
                        ),
                        child: MediumText(text: "CHECKOUT", color: Colors.white,)),
                  ),
                )


              ]),
        ),
      ],
    );
  }
}
