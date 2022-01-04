import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Donate extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  String country_id;
  List<String> country = [
    "USDT",
    "ETH",
    "USD",
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(colors: [Color.fromRGBO(26,26,26,1),Color.fromRGBO(226,16,78,1),]),
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color.fromRGBO(26,26,26,1),Color.fromRGBO(226,16,78,1),]),
              )
            ),
          titleSpacing: 0.0,
          title: Text(
            'Donate',
            style: white16SemiBoldTextStyle,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: whiteColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          children: [
            aboutUser(),
            height20Space,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                height20Space,
                Padding(
                  padding: EdgeInsets.only(right: 20.0, left: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          color: blackColor.withOpacity(0.05),
                        ),
                      ],
                    ),
                    child: TextField(
                      // style: black14MediumTextStyle,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    fillColor: Color.fromRGBO(29,22,77, 1),
                    filled: true,
                          labelText: 'Enter Amount in USDT',
                          labelStyle: TextStyle(color: Colors.white),
                          suffix: Text(
                                  'USDT',
                                  style: TextStyle(color: Colors.white),
                                ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor, width: 0.7),
                          ),
                        ),
                    ),
                  ),
                ),
                height20Space,
                Padding(
                  padding: EdgeInsets.only(right: 20.0, left: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          color: blackColor.withOpacity(0.05),
                        ),
                      ],
                    ),
                    child: TextField(
                      // style: black14MediumTextStyle,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    fillColor: Color.fromRGBO(29,22,77, 1),
                    filled: true,
                          labelText: 'Enter Amount in ETH',
                          labelStyle: TextStyle(color: Colors.white),
                          suffix: Text(
                                  'ETH',
                                  style: TextStyle(color: Colors.white),
                                ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor, width: 0.7),
                          ),
                        ),
                    ),
                  ),
                ),
              ]),
              height20Space,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                  child: InkWell(
                    onTap: () {
                      
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: BankDetails(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                       color: Color.fromRGBO(138,2,164, 1),
                      ),
                      child: Text(
                        'Donate',
                        style: white14BoldTextStyle,
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
  aboutUser() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100.0,
            width: 100.0,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    'assets/user/user_8.jpg',
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: greenColor,
                      border: Border.all(
                        width: 2.0,
                        color: whiteColor,
                      ),
                    ),
                    child: Icon(
                      Icons.check,
                      size: 25.0,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          heightSpace,
          Text(
            'Verified',
            style: TextStyle(color: Colors.white),
          ),
          heightSpace,
          Text(
            'Mr. Jack',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          height5Space,
          Text(
            'Balance: \$4252',
            style: TextStyle(color: Colors.white, fontSize: 16,),
          ),
        ],
      ),
    );
  }
}
