import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/profile/bank_slider.dart';
import 'package:cryptox/pages/profile/charity.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  logoutDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        double width = MediaQuery.of(context).size.width;
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Wrap(
            children: [
              Container(
                decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color.fromRGBO(226,16,78,1),Color.fromRGBO(26,26,26,1),]),
                      ),
                width: double.infinity,
                padding: EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You sure want to logout?',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    heightSpace,
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            width: (width - fixPadding * 14.0) / 2,
                            padding: EdgeInsets.symmetric(vertical: fixPadding),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 1.0,
                                color: primaryColor,
                              ),
                              color: Color.fromRGBO(138,2,164, 1),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            width: (width - fixPadding * 14.0) / 2,
                            padding: EdgeInsets.symmetric(vertical: fixPadding),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color.fromRGBO(138,2,164, 1),
                            ),
                            child: Text(
                              'Logout',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color.fromRGBO(26,26,26,1),Color.fromRGBO(226,16,78,1),]),
                      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              aboutUser(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: EditProfile(),
                    ),
                  );
                },
                child: profileItem(
                    Icons.person, 'Edit Profile', 'Edit your profile'),
              ),
              divider(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: BankSlider(),
                    ),
                  );
                },
                child: profileItem(Icons.account_balance, 'Bank Details',
                    'This account is used to facilitate all your deposits and withdrawals'),
              ),
              divider(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: Charity(),
                    ),
                  );
                },
                child: profileItem(
                    Icons.volunteer_activism_outlined, 'Charity', 'Donate Your Funds to the Charity'),
              ),
              heightSpace,
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: Support(),
                    ),
                  );
                },
                child: profileItem(Icons.headset_mic, 'Help & Support',
                    'Create a ticket and we will contact you'),
              ),
              divider(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: PrivacyPolicy(),
                    ),
                  );
                },
                child: profileItem(
                    Icons.note, 'Privacy Policy', 'How we work & use your data'),
              ),
              divider(),
              InkWell(
                onTap: () {},
                child: profileItem(
                    Icons.star_border, 'Rate Us', 'Tell us what you think'),
              ),
              heightSpace,
              InkWell(
                onTap: () {},
                child: profileItem(Icons.android, 'About CryptoX', 'v1.0.0'),
              ),
              heightSpace,

              // Logout
              InkWell(
                onTap: () => logoutDialog(),
                child: Container(
                  padding: EdgeInsets.fromLTRB(fixPadding * 2.0, fixPadding * 1.5,
                      fixPadding * 2.0, fixPadding * 1.5),
                  color: whiteColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        size: 28.0,
                        color: blackColor,
                      ),
                      width20Space,
                      Text(
                        'Logout',
                        style: red16MediumTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              height20Space,
            ],
          ),
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
                    'assets/user/user_14.jpg',
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
            'Peter Jones',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          height5Space,
          Text(
            '+1 123456987',
            style: TextStyle(color: Colors.white, fontSize: 16,),
          ),
        ],
      ),
    );
  }

  profileItem(icon, title, subtitle) {
    return Container(
      padding: EdgeInsets.fromLTRB(fixPadding * 2.0, fixPadding * 1.5,
          fixPadding * 2.0, fixPadding * 1.5),
      color: Color.fromRGBO(29,22,47, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28.0,
            color: Colors.white,
          ),
          width20Space,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 3.0),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  divider() {
    return Container(
      width: double.infinity,
      height: 0.7,
      color: Colors.white.withOpacity(0.35),
    );
  }
}
