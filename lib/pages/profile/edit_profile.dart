import 'package:cryptox/constant/constant.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = 'Peter Jones';
    emailController.text = 'peter@test.com';
    phoneController.text = '123456789';
    passwordController.text = '1234567';
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
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
            'Edit Profile',
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
            Container(
              padding: EdgeInsets.all(fixPadding * 2.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 160.0,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Container(
                          width: width - fixPadding * 4.0,
                          alignment: Alignment.center,
                          child: Container(
                            width: 140.0,
                            height: 140.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70.0),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/user/user_14.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          child: Container(
                            width: width - fixPadding * 4.0,
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () => _selectOptionBottomSheet(),
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                width: 140.0,
                                padding: EdgeInsets.symmetric(
                                    vertical: fixPadding * 0.6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.orange,
                                  border: Border.all(
                                    width: 2.0,
                                    color: whiteColor,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera_alt,
                                      size: 16.0,
                                      color: whiteColor,
                                    ),
                                    SizedBox(width: 5.0),
                                    Text(
                                      'Change',
                                      style: white12MediumTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  heightSpace,

                  // Name Field Start
                  Container(
                    padding: EdgeInsets.only(top: fixPadding, bottom: fixPadding),
                    child: Theme(
                      data: ThemeData(
                        primaryColor: primaryColor,
                        textSelectionTheme: TextSelectionThemeData(
                          cursorColor: Colors.white,
                        ),
                      ),
                      child: TextField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    fillColor: Color.fromRGBO(29,22,77, 1),
                    filled: true,
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(color: Colors.white, width: 0.7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Name Field End

                  // Email Field Start
                  Container(
                    padding: EdgeInsets.only(top: fixPadding, bottom: fixPadding),
                    child: Theme(
                      data: ThemeData(
                        primaryColor: primaryColor,
                        textSelectionTheme: TextSelectionThemeData(
                          cursorColor: Colors.white,
                        ),
                      ),
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    fillColor: Color.fromRGBO(29,22,77, 1),
                    filled: true,
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor, width: 0.7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Email Field End

                  // Phone Number Field Start
                  Container(
                    padding: EdgeInsets.only(top: fixPadding, bottom: fixPadding),
                    child: Theme(
                      data: ThemeData(
                        primaryColor: primaryColor,
                        textSelectionTheme: TextSelectionThemeData(
                          cursorColor: Colors.white,
                        ),
                      ),
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    fillColor: Color.fromRGBO(29,22,77, 1),
                    filled: true,
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor, width: 0.7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Phone Number Field End

                  // Password Field Start
                  Container(
                    padding: EdgeInsets.only(top: fixPadding, bottom: fixPadding),
                    child: Theme(
                      data: ThemeData(
                        primaryColor: primaryColor,
                        textSelectionTheme: TextSelectionThemeData(
                          cursorColor: Colors.white,
                        ),
                      ),
                      child: TextField(
                        controller: passwordController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    fillColor: Color.fromRGBO(29,22,77, 1),
                    filled: true,
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor, width: 0.7),
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                  // Password Field End
                  heightSpace,
                  // Save Button Start
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(7.0),
                    child: Container(
                      width: width,
                      padding: EdgeInsets.all(fixPadding * 1.5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Color.fromRGBO(138,2,164, 1),
                      ),
                      child: Text(
                        'Save',
                        style: white14BoldTextStyle,
                      ),
                    ),
                  ),
                  // Save Button End
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Bottom Sheet for Select Options (Camera or Gallery) Start Here
  void _selectOptionBottomSheet() {
    double width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: Color.fromRGBO(39,38,44,1),
            child: Wrap(
              children: <Widget>[
                Container(
                  child: Container(
                    padding: EdgeInsets.all(fixPadding),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: width,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Choose Option',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        heightSpace,
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: fixPadding),
                          width: width,
                          height: 1.0,
                          color: Colors.white.withOpacity(0.8),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: width,
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.camera_alt,
                                  color: Colors.white.withOpacity(0.7),
                                  size: 20.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Camera', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: width,
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.photo_album,
                                  color: Colors.white.withOpacity(0.7),
                                  size: 20.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Upload from Gallery',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
  // Bottom Sheet for Select Options (Camera or Gallery) Ends Here
}
