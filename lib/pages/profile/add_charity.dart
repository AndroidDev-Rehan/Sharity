import 'package:cryptox/models/daos/all_charities.dart';
import 'package:cryptox/pages/admin/adminCharity.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/models/charity_model.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:io';

import 'package:uuid/uuid.dart';

XFile image;


class AddCharity extends StatefulWidget {
  bool imageSelected = false;

  final bool fromAdmin;
  AddCharity(this.fromAdmin);

  @override
  _AddCharityState createState() => _AddCharityState();
}

class _AddCharityState extends State<AddCharity> {
  final nameController = TextEditingController();
  final ethereumController = TextEditingController();
  final descController = TextEditingController();
  bool loading = false;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(colors: [
          Color.fromRGBO(26, 26, 26, 1),
          Color.fromRGBO(226, 16, 78, 1),
        ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(26, 26, 26, 1),
              Color.fromRGBO(226, 16, 78, 1),
            ]),
          )),
          titleSpacing: 0.0,
          title: Text(
            'Add Charity',
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
        body: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(fixPadding * 2.0),
                    child: Form(
                      key: _formKey,
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
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        // const SizedBox(width: 20.0, height: 100.0),
                                        const Text(
                                          'To',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          width: 20.0,
                                        ),
                                        DefaultTextStyle(
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontFamily: 'Horizon',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          child: AnimatedTextKit(
                                            animatedTexts: [
                                              RotateAnimatedText('Add Some'),
                                              RotateAnimatedText('Charity💖'),
                                            ],
                                            isRepeatingAnimation: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Text("Charity💖", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),),
                                  ),
                                ),
                                ImageAndAddImg()
                              ],
                            ),
                          ),
                          heightSpace,

                          /// Name Field Start
                          Container(
                            padding: EdgeInsets.only(
                                top: fixPadding, bottom: fixPadding),
                            child: Theme(
                              data: ThemeData(
                                primaryColor: primaryColor,
                                textSelectionTheme: TextSelectionThemeData(
                                  cursorColor: Colors.white,
                                ),
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return "can't leave the name empty";
                                  return null;
                                },
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.5)),
                                  fillColor: Color.fromRGBO(29, 22, 77, 1),
                                  filled: true,
                                  labelText: 'Name',
                                  labelStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Name Field End

                          /// Ethereum Field Start
                          Container(
                            padding: EdgeInsets.only(
                                top: fixPadding, bottom: fixPadding),
                            child: Theme(
                              data: ThemeData(
                                primaryColor: primaryColor,
                                textSelectionTheme: TextSelectionThemeData(
                                  cursorColor: Colors.white,
                                ),
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return "can't leave the name empty";
                                  else if (value.length != 42)
                                    return "Incorrect length of address";
                                  return null;
                                },

                                controller: ethereumController,
//                        keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.5)),
                                  fillColor: Color.fromRGBO(29, 22, 77, 1),
                                  filled: true,
                                  labelText: 'Eth. Address',
                                  labelStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: greyColor, width: 0.7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Email Field End

                          ///Description Field
                          Container(
                            padding: EdgeInsets.only(
                                top: fixPadding, bottom: fixPadding),
                            child: Theme(
                              data: ThemeData(
                                primaryColor: primaryColor,
                                textSelectionTheme: TextSelectionThemeData(
                                  cursorColor: Colors.white,
                                ),
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty)
                                    return "can't leave the description empty";
                                  return null;
                                },
                                controller: descController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.5)),
                                  fillColor: Color.fromRGBO(29, 22, 77, 1),
                                  filled: true,
                                  labelText: 'Description',
                                  labelStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: greyColor, width: 0.7),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          heightSpace,

                          /// Save Button Start
                          InkWell(
                            onTap: () async {
                              if(_formKey.currentState.validate())
                                {
                                  if (image != null)
                                  {
                                      setState(() {
                                        loading = true;
                                      });

                                      final imgUrl =
                                      await uploadImageToFirebaseAndReturnUrl(image);
                                      CharityModel charity = CharityModel(
                                          description: descController.text,
                                          name: nameController.text,
                                          ethAddress: ethereumController.text,
                                          imageUrl: imgUrl,
                                          cid: Uuid().v4().toString());
                                      await AllCharities().insertCharity(charity);
                                      image = null;
                                      if (widget.fromAdmin == true) {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.rightToLeft,
                                            child: AdminCharityScreen(),
                                          ),
                                        );
                                      } else {
                                        Navigator.pop(context);
                                      }
                                      setState(() {
                                        loading = false;
                                      });
                                    }
                                  else {
                                    Fluttertoast.showToast(
                                        msg: "Set the image for charity.",
                                        toastLength: Toast.LENGTH_LONG,
                                        timeInSecForIosWeb: 3,
                                    );
                                  }
                                }
                            },
                            borderRadius: BorderRadius.circular(7.0),
                            child: Container(
                              width: width,
                              padding: EdgeInsets.all(fixPadding * 1.5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.0),
                                color: Color.fromRGBO(138, 2, 164, 1),
                              ),
                              child: Text(
                                'Add Charity',
                                style: white14BoldTextStyle,
                              ),
                            ),
                          ),
                          // Save Button End
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<String> uploadImageToFirebaseAndReturnUrl(XFile xFile) async {
    File imgFile = File(xFile.path);

    FirebaseStorage storage = FirebaseStorage.instance;

    final ref = storage.ref(Uuid().v4().toString());

    await ref.putFile(imgFile);
    return await ref.getDownloadURL();
  }

  // Bottom Sheet for Select Options (Camera or Gallery) Ends Here
}

class ImageAndAddImg extends StatefulWidget {
  const ImageAndAddImg({Key key}) : super(key: key);

  @override
  _ImageAndAddImgState createState() => _ImageAndAddImgState();
}

class _ImageAndAddImgState extends State<ImageAndAddImg> {

  bool imageSelected = false;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 0.0,
      child: Container(
        width: width - fixPadding * 4.0,
        alignment: Alignment.center,
        child: imageSelected
            ? InkWell(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: FileImage(
                          File(image.path),
                        ),
                        fit: BoxFit.cover),
                    color: Colors.deepPurple,
                  ),
                ),
                onTap: () => _selectOptionBottomSheet(),
              )
            : InkWell(
                onTap: () => _selectOptionBottomSheet(),
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 140.0,
                  padding: EdgeInsets.symmetric(vertical: fixPadding * 0.6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.indigoAccent,
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
                        'Add Image',
                        style: white12MediumTextStyle,
                      ),
                    ],
                  ),
                ),
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
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(226, 16, 78, 1),
                Color.fromRGBO(26, 26, 26, 1),
              ]),
            ),
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
                          onTap: () async {
                            final ImagePicker _picker = ImagePicker();
                            image = await _picker.pickImage(
                                source: ImageSource.camera);
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
                                Text('Camera',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            final ImagePicker _picker = ImagePicker();
                            // Pick an image
                            image = await _picker.pickImage(
                                source: ImageSource.gallery);
                            if (image != null){
                              setState(() {
                                imageSelected = true;
                              });
                            }
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
}
