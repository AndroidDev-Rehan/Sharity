import 'dart:async';

import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/admin/adminCharity.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

import '../../main.dart';

class OTPScreen extends StatefulWidget {

  final verificationId;

  OTPScreen(this.verificationId);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

    String otpText;

  var firstController = TextEditingController();
  var secondController = TextEditingController();
  var thirdController = TextEditingController();
  var fourthController = TextEditingController();
  var fifthController = TextEditingController();
  var sixthController = TextEditingController();

  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();
  FocusNode fifthFocusNode = FocusNode();
  FocusNode sixthFocusNode = FocusNode();


  loadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SpinKitRing(
                      color: primaryColor,
                      size: 40.0,
                      lineWidth: 1.2,
                    ),
                    SizedBox(height: 25.0),
                    Text(
                      'Please Wait..',
                      style: grey14MediumTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft,
                child: EnterPinScreen())));
  }



  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color.fromRGBO(26,26,26,1),Color.fromRGBO(226,16,78,1),]),
                      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(height: 70.0),
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                  child: Text(
                    'Enter the otp code from the phone we just sent you',
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 50.0),

                // OTP Box Start
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      /// 1 Start
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                           color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              spreadRadius: 1.0,
                              color: Color.fromRGBO(159,77,177, 1).withOpacity(0.6),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: firstController,
                          style: black14MediumTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(18.0),
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (v) {
                            FocusScope.of(context).requestFocus(secondFocusNode);
                          },
                        ),
                      ),
                      // 1 End
                      // 2 Start
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                           color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              spreadRadius: 1.0,
                              color: Color.fromRGBO(159,77,177, 1).withOpacity(0.6),
                            ),
                          ],
                        ),
                        child: TextField(
                          focusNode: secondFocusNode,
                          controller: secondController,
                          style: black14MediumTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(18.0),
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (v) {
                            FocusScope.of(context).requestFocus(thirdFocusNode);
                          },
                        ),
                      ),
                      // 2 End
                      // 3 Start
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              spreadRadius: 1.0,
                              color: Color.fromRGBO(159,77,177, 1).withOpacity(0.6),
                            ),
                          ],
                        ),
                        child: TextField(
                          focusNode: thirdFocusNode,
                          controller: thirdController,
                          style: black14MediumTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(18.0),
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (v) {
                            FocusScope.of(context).requestFocus(fourthFocusNode);
                          },
                        ),
                      ),
                      // 3 End
                      // 4 Start
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              spreadRadius: 1.0,
                              color: Color.fromRGBO(159,77,177, 1).withOpacity(0.6),
                            ),
                          ],
                        ),
                        child: TextField(
                          focusNode: fourthFocusNode,
                          controller: fourthController,
                          style: black14MediumTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(18.0),
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (v) {
                            FocusScope.of(context).requestFocus(fifthFocusNode);
                          },
                        ),
                      ),
                      // 4 End
                      ///5th
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              spreadRadius: 1.0,
                              color: Color.fromRGBO(159,77,177, 1).withOpacity(0.6),
                            ),
                          ],
                        ),
                        child: TextField(
                          focusNode: fifthFocusNode,
                          controller: fifthController,
                          style: black14MediumTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(18.0),
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (v) {
                            FocusScope.of(context).requestFocus(sixthFocusNode);
                          },
                        ),
                      ),
                      ///6th
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              spreadRadius: 1.0,
                              color: Color.fromRGBO(159,77,177, 1).withOpacity(0.6),
                            ),
                          ],
                        ),
                        child: TextField(
                          focusNode: sixthFocusNode,
                          controller: sixthController,
                          style: black14MediumTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(18.0),
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (v) {
                            //TODO hmm
//                            loadingDialog();
                          },
                        ),
                      ),

                    ],
                  ),
                ),
                // OTP Box End

                SizedBox(height: 30.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Didn\'t receive OTP Code!',
                        style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                      width5Space,
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Resend',
                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500,),
                        ),
                      ),
                    ],
                  ),
                ),
                height20Space,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                  child: InkWell(
                    onTap: () async{

                      otpText = "$firstController$secondController$thirdController$fourthController$fifthController$sixthController";
                      await _verifyOTP(otpText);

                    // borderRadius: BorderRadius.circular(10.0),
                    Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: BuySuccessScreen(),
                          ),
                        );
                    },
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
                        style: white14BoldTextStyle,
                      ),
                    ),
                  ),
                ),
                height20Space,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _verifyOTP(String otpText) async {


    // we know that _verificationId is not empty
    final credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: otpText);

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      if (FirebaseAuth.instance.currentUser != null) {
        if (FirebaseAuth.instance.currentUser.phoneNumber.toString() == adminPhoneNumber)
          {
            navigatorKey.currentState.push(
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: AdminCharityScreen(),
                )
            );
          }
        else {
          navigatorKey.currentState.push(
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: Register(),
              )
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }

}
