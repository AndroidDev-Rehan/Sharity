import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/auth/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../bottom_bar.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                    color: Colors.white
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
                Text(
                  'Register your account',
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
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
                      style: black14MediumTextStyle,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20.0),
                        hintText: 'Username',
                        hintStyle: black14MediumTextStyle,
                        border: InputBorder.none,
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
                      style: black14MediumTextStyle,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20.0),
                        hintText: 'Email',
                        hintStyle: black14MediumTextStyle,
                        border: InputBorder.none,
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
                      style: black14MediumTextStyle,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20.0),
                        hintText: 'Password',
                        hintStyle: black14MediumTextStyle,
                        border: InputBorder.none,
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
                      style: black14MediumTextStyle,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20.0),
                        hintText: 'Confirm Password',
                        hintStyle: black14MediumTextStyle,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
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
                          child: OTPScreen(),
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
}
