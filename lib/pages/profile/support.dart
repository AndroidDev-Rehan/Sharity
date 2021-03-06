import 'package:cryptox/constant/constant.dart';
import 'package:flutter/material.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
            'Support',
            style: TextStyle(color: Colors.white),
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
            heightSpace,
            heightSpace,
            // Name textfield start
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    fillColor: Color.fromRGBO(29,22,77, 1),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: primaryColor, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                    ),
                  ),
                ),
              ),
            ),
            // Name textfield end

            heightSpace,
            heightSpace,
            // Email Address textfield start
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email address",
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    fillColor: Color.fromRGBO(29,22,77, 1),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: primaryColor, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                    ),
                  ),
                ),
              ),
            ),
            // Email Address textfield end

            heightSpace,
            heightSpace,

            // Write here textfield start
            Padding(
              padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Write here",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    fillColor: Color.fromRGBO(29,22,77, 1),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: primaryColor, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                  ),
                ),
              ),
            ),
            // Write here textfield end

            SizedBox(height: 30.0),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(20.0),
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(fixPadding * 1.0),
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                     color: Color.fromRGBO(138,2,164, 1),),
                  child: Text(
                    'Submit',
                    style: white14BoldTextStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
