import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/cart/summaryCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacy_app/services/auth_service.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text(
              "Checkout",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
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
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.15),
                      spreadRadius: 5,
                      blurRadius: 3,
                      offset: const Offset(0, 0),
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
                          'John Doe',
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
                  ]),
            ),
            TextButton.icon(
              icon: const Icon(Icons.add_circle, color: Colors.indigo),
              onPressed: () {},
              label: const Text(
                "Add New Card",
                style: TextStyle(fontSize: 16.0, color: Colors.indigo),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(5.0),
              child: const ListTile(
                leading: Icon(
                  FontAwesomeIcons.applePay,
                  color: Colors.black,
                ),
                title: Text("Apple Pay"),
                trailing: Icon(Icons.radio_button_off),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(3.0),
              child: const ListTile(
                leading: Icon(
                  FontAwesomeIcons.paypal,
                  color: Colors.indigo,
                ),
                title: Text("Paypal"),
                trailing: Icon(Icons.radio_button_off),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(3.0),
              child: const ListTile(
                leading: Icon(
                  FontAwesomeIcons.ccMastercard,
                  color: Color.fromARGB(255, 240, 108, 21),
                ),
                title: Text("Master Card"),
                trailing: Icon(Icons.radio_button_off),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.all(8.0),
            //   padding: const EdgeInsets.all(3.0),
            //   child: const ListTile(
            //     leading: Icon(
            //       Icons.add_circle,
            //       color: Colors.indigo,
            //     ),
            //     title: Text("Add New Payment Method"),
            //     trailing: Icon(Icons.arrow_forward_ios),
            //   ),
            // ),
            const SizedBox(height: 20.0),
            const Positioned(
              bottom: 0,
              child: SummaryCard(),
            ),
          ],
        ),
      ),
    );
  }
}
