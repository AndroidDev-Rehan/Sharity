import 'dart:async';

import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/admin/adminCharity.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(
//            builder: (context) => loginStatus()? loginedAsAdmin() ? AdminCharityScreen() : BottomBar : Login()
            builder: (context) {
              if (loginStatus()){
                if(loginedAsAdmin())
                  {
                    return AdminCharityScreen();
                  }
                else return BottomBar();
              }
              else
                return Login();
              return AdminCharityScreen();
            }
        )
        )
    );
  }

  bool loginStatus() {
    if(FirebaseAuth.instance.currentUser == null)
      return false;
    return true;
  }

  bool loginedAsAdmin() {
    if(FirebaseAuth.instance.currentUser.phoneNumber.toString() == adminPhoneNumber )
      return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
             Container(
              width: width,
              height: height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.0),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/logo.jpg',
                                ),
                                fit: BoxFit.fill,
                              ),
                          ),
            ),
            Container(
              color: Colors.blueGrey.withOpacity(0.2),
            ),
            Positioned(
              bottom: 30.0,
              child: Container(
                width: width,
                child: SpinKitRing(
                  color: Colors.amberAccent,
                  size: 50.0,
                  lineWidth: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
