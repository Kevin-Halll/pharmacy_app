import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/components/add_new_card/card_type.dart';
import 'package:pharmacy_app/components/add_new_card/input_formatters.dart';
import 'package:pharmacy_app/components/add_new_card/card_utilis.dart';
import 'package:pharmacy_app/components/add_new_card/save_button.dart';

void main() {
  runApp(Add_New_Card());
}

class Add_New_Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckOut(),
    );
  }
}

class CheckOut extends StatefulWidget {
  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  TextEditingController cardNumberController = TextEditingController();

  CardType cardType = CardType.Invalid;

  void getCardTypeFrmNum() {
    if (cardNumberController.text.length <= 6) {
      String cardNum = CardUtils.getCleanedNumber(cardNumberController.text);
      CardType type = CardUtils.getCardTypeFrmNumber(cardNum);
      if (type != CardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }

  @override
  void initState() {
    cardNumberController.addListener(
      () {
        getCardTypeFrmNum();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        toolbarHeight: 70.0,
        title: Center(
          child: Text(
            'Add a New Card',
            style: TextStyle(color: Colors.black, fontSize: 30.0),
          ),
        ),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        leading: Container(
          decoration: BoxDecoration(
            color: Color(0xFFE7F1F8),
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.only(left: 10.0, top: 10.0),
          width: 50.0,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back, color: Color(0xFF2B30B4)),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Spacer(flex: 1),
              TextFormField(
                controller: cardNumberController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(16),
                  CardInputFormat(),
                ],
                maxLines: 1,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardUtils.getCardIcon(cardType),
                  ),
                  prefixIcon: cardType == CardType.Invalid
                      ? null
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "assets/icons/card.svg",
                            color: Color(0xFF1B75BC),
                          ),
                        ),
                  isDense: true,
                  filled: true,
                  fillColor: Color(0xFFE7F1F8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  hintText: 'Enter Card Number (16-digits)',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Color(0xFFE7F1F8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  hintText: 'Full Name',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SvgPicture.asset(
                      "assets/icons/user.svg",
                      color: Color(0xFF1B75BC),
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      maxLines: 1,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Color(0xFFE7F1F8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        hintText: 'CVV',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SvgPicture.asset(
                            "assets/icons/Cvv.svg",
                            color: Color(0xFF1B75BC),
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(5),
                        FilteringTextInputFormatter.digitsOnly,
                        CardMonthInputFormatter(),
                      ],
                      maxLines: 1,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Color(0xFFE7F1F8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        hintText: 'MM/YY',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SvgPicture.asset(
                            "assets/icons/calender.svg",
                            color: Color(0xFF1B75BC),
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(flex: 2),
              OutlinedButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/scan.svg"),
                label: Text('Scan Card'),
              ),
              SaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class CardInputFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    for (var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int index = i + 1;

      if (index % 4 == 0 && inputData.length != index) {
        buffer.write("  "); //spacing between numbers in sets of 4s
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(
        offset: buffer.toString().length,
      ),
    );
  }
}
