import 'dart:async';
import 'package:flutter/material.dart';
import '../../custom_widgets/colors.dart';

class Banner1 extends StatefulWidget {
  const Banner1({Key? key}) : super(key: key,);

  @override
  State<Banner1> createState() => _Banner1State();
}

class _Banner1State extends State<Banner1> {
  int _currentPage  =0;
  Timer? _timer;
  PageController _pageController = PageController(initialPage
      :0);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        // SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.fromLTRB(3, 20, 3, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            // color: Colors.lightBlue,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.lightBlue),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.mainBlue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Image.asset('assets/images/doctor.png'),
                            SizedBox(
                              child: Padding(
                                padding:
                                const EdgeInsets.only(right: 15, top: 10),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Get Free',
                                          style: TextStyle(
                                              color: AppColor.thirdBlue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                        Text(
                                          'Consultation from\nour in-house pharmacist',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: AppColor.thirdBlue,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          '(888) 888 - 8888',
                                          style: TextStyle(
                                              color: AppColor.thirdBlue, fontSize: 16),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/doctor.png',
                  width: 180,
                  height: 250,
                  // fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(3, 20, 3, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            // color: Colors.lightBlue,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.lightBlue),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.mainBlue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Image.asset('assets/images/doctor.png'),
                            SizedBox(
                              child: Padding(
                                padding:
                                const EdgeInsets.only(left: 15, top: 10),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '50% OFF!',
                                          style: TextStyle(
                                              color: AppColor.thirdBlue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                        Text(
                                          'Your prescriptions when you\nbecome a lifetime member',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColor.thirdBlue),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20)))),
                                        child: Text('Become a Member')),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/opened-bottle-of-pills.png',
                      width: 180,
                      height: 250,
                      // fit: BoxFit.cover,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(3, 20, 3, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            // color: Colors.lightBlue,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.lightBlue),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.mainBlue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              child: Padding(
                                padding:
                                const EdgeInsets.only(right: 15, top: 10),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'We Deliver',
                                          style: TextStyle(
                                              color: AppColor.thirdBlue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                        Text(
                                          'Islandwide delivery service\n'
                                              'and free delivery with your\n'
                                              'lifetime membership',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: -8,
                  child: Image.asset(
                    'assets/images/delivery-man.png',
                    width: 150,
                    height: 200,
                    // fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}