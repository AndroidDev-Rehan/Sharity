import 'dart:io';

import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomBar extends StatefulWidget {
  final int index;

  const BottomBar({Key key, this.index}) : super(key: key);
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  DateTime currentBackPressTime;
  int currentIndex;
  @override
  void initState() {
    super.initState();

    if (widget.index != null) {
      setState(() {
        currentIndex = widget.index;
      });
    } else {
      setState(() {
        currentIndex = 1;
      });
    }
  }

  changeIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        elevation: 3.0,
        child: Container(
          height: 60.0,
          width: double.infinity,
          color: Color.fromRGBO(32,33,36, 1),
          padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              bottomBarItem('assets/icon/primary-color/home.png',
                  'assets/icon/grey/home.png', 1),
              bottomBarItem('assets/icon/primary-color/statistic.png',
                  'assets/icon/grey/statistic.png', 2),
              bottomBarItem('assets/icon/primary-color/portfolio.png',
                  'assets/icon/grey/portfolio.png', 3),
              bottomBarItem('assets/icon/primary-color/user.png',
                  'assets/icon/grey/user.png', 4),
            ],
          ),
        ),
      ),
      body: WillPopScope(
        child: (currentIndex == 1)
            ? Home()
            : (currentIndex == 2)
                ? Market()
                : (currentIndex == 3)
                    ? Portfolio()
                    : Profile(),
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
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

  bottomBarItem(activeIconPath, nonActiveIconPath, index) {
    return InkWell(
      onTap: () => changeIndex(index),
      child: Padding(
        padding: const EdgeInsets.all(fixPadding * 0.6),
        child: Image.asset(
          (index == currentIndex) ? activeIconPath : nonActiveIconPath,
          width: 24.0,
          height: 24.0,
        ),
      ),
    );
  }
}
