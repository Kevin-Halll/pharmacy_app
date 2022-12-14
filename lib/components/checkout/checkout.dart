import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/cart/summaryCard.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

String? payment;

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            shadowColor: Colors.white,
            backgroundColor: Colors.white,
            title: ListTile(
              title: Text(
                "Checkout",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(255, 40, 3, 250),
                      Color.fromARGB(255, 46, 42, 247),
                      Color.fromARGB(255, 178, 176, 243),
                      Color.fromARGB(255, 46, 42, 247),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.15),
                      spreadRadius: 5,
                      blurRadius: 3,
                      offset: Offset(0, 0),
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'VISA',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Icon(
                        Icons.contactless_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 50,
                    margin: const EdgeInsets.only(right: 10),
                    child: Image.asset('assets/images/chip.png'),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 255, 251, 0),
                    thickness: 3,
                    indent: 0,
                    endIndent: 0,
                  ),
                  const Text(
                    '1234   5678  9100 1234',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Text(
                        'Kevin Hall',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Container(
                        width: 40,
                        // ignore: sort_child_properties_last
                        child: Image.asset('assets/images/master.png'),
                        margin: const EdgeInsets.only(right: 10),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      RadioListTile(
                        title: Text("Apple Pay"),
                        value: "apple pay",
                        groupValue: payment,
                        onChanged: (value) {
                          setState(() {
                            payment = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Paypal"),
                        value: "paypal",
                        groupValue: payment,
                        onChanged: (value) {
                          setState(() {
                            payment = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Master Card"),
                        value: "master card",
                        groupValue: payment,
                        onChanged: (value) {
                          setState(() {
                            payment = value.toString();
                          });
                        },
                      ),
                      const Positioned(
                        bottom: 0,
                        child: SummaryCard(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
