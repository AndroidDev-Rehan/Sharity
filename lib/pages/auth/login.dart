import 'dart:io';

import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  DateTime currentBackPressTime;
  String phoneNumber = '';
  String phoneIsoCode;
  final TextEditingController controller = TextEditingController();
  String initialCountry = '92';
  PhoneNumber number = PhoneNumber(isoCode: '92');
  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color.fromRGBO(26,26,26,1),Color.fromRGBO(226,16,78,1),]),
                      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: WillPopScope(
          child: ListView(
            children: [
              SizedBox(height: 100.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/gifts.gif',
                    width: 340.0,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'Signin with phone number',
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      padding: EdgeInsets.only(left: fixPadding * 2.0),
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
                      child: InternationalPhoneNumberInput(
                        textStyle: black14RegularTextStyle,
//                        autoValidate: false,
                        selectorTextStyle: black16MediumTextStyle,
                        initialValue: number,
                        textFieldController: controller,
                        inputBorder: InputBorder.none,
                        inputDecoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 17),
                          hintText: 'Phone Number',
                          hintStyle: black14RegularTextStyle,
                          border: InputBorder.none,
                        ),
//                        selectorType: PhoneInputSelectorType.DIALOG,
                      selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.DIALOG,
                        trailingSpace: false

                      ),
                        autoValidateMode: AutovalidateMode.disabled,
                        spaceBetweenSelectorAndTextField: 0,
                      ),
                    ),
                  ),
                  heightSpace,
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Register(),
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
                          'Continue',
                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  heightSpace,
                  Text(
                    'We’ll send otp for verification',
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  height20Space,
                   
                ],
              ),
            ],
          ),
          onWillPop: () async {
            bool backStatus = onWillPop();
            if (backStatus) {
              exit(0);
            }
            return false;
          },
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }
}
