import 'dart:io';

import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/main.dart';
import 'package:cryptox/pages/admin/adminCharity.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:cryptox/utils/phone_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool loading = false;
  int count = 0;
  bool loginSuccess = false;
  bool otpSent = false;
  String vId;

  DateTime currentBackPressTime;
  String phoneNumber = '';
  String phoneIsoCode;
  String controllerText = "";
//  final TextEditingController controller = TextEditingController();
  String initialCountry = '92';
  PhoneNumber number = PhoneNumber(isoCode: '92');

  void onPhoneNumberChange(String number, String internationalizedPhoneNumber, String isoCode) {
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
          child: loading
              ? Center(child: CircularProgressIndicator(),)
              : ListView(
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
                        // onSaved: (PhoneNumber number) {
                        //   print('On Saved: $number');
                        // },
                        textStyle: black14RegularTextStyle,
//                        autoValidate: false,
                        selectorTextStyle: black16MediumTextStyle,
                        initialValue: number,
//                        textFieldController: controller,
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
                        trailingSpace: false,
                      ),
                        autoValidateMode: AutovalidateMode.disabled,
                        spaceBetweenSelectorAndTextField: 0,
                        onInputChanged: (PhoneNumber value) {
                          controllerText = value.toString();
                        },
                      ),
                    ),
                  ),
                  heightSpace,
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                    child: InkWell(
                      onTap: () async{
                        setState(() {
                          loading = true;
                        });
                        await sendOTP(controllerText);
                        // await Future.delayed(Duration(seconds: 3));
                        // setState(() {
                        //   loading = false;
                        // });
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

  Future<void> sendOTP(String phoneNumber ) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    print("send OTP is finishing..");
  }

  void codeAutoRetrievalTimeout(String verificationId) {
  }

  void codeSent(String verificationId, [int a]) {
    vId = verificationId;
    navigatorKey.currentState.push(
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: OTPScreen(verificationId),
        )
    );
  }

  void verificationFailed(FirebaseAuthException exception) {
    Fluttertoast.showToast(msg: "There is some error.Please Try again Later");
  }

  Future<void> verificationCompleted(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
    if (FirebaseAuth.instance.currentUser != null) {

      if (FirebaseAuth.instance.currentUser.phoneNumber.toString() == adminPhoneNumber) {
        navigatorKey.currentState.push(
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: AdminCharityScreen(),
            )
        );
      }
      else {
        loginSuccess = true;
        navigatorKey.currentState.push(
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: Register(),
            )
        );
      }
    }
    else {
      print("Failed to Sign In");
    }
  }



}
