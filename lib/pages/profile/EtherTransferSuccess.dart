import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class EtherTransferSuccessScreen extends StatelessWidget {
  const EtherTransferSuccessScreen(this.successMsg, {Key key}) : super(key: key);
  final String successMsg;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color.fromRGBO(26,26,26,1),Color.fromRGBO(226,16,78,1),]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                height20Space,
                height20Space,
                height20Space,
                Text(
                  'Congratulations!',
                  style: TextStyle(color: Colors.green, fontSize: 16, fontWeight:FontWeight.bold,),
                ),
              ],
            ),
            Container(
              width: 140.0,
              height: 140.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70.0),
                color: Colors.white.withOpacity(0.3),
              ),
              child: Container(
                width: 110.0,
                height: 110.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55.0),
                  color: greenColor,
                ),
                child: Icon(
                  Icons.check,
                  size: 50.0,
                  color: whiteColor,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width - fixPadding * 4.0,
                  child: Text(
                    successMsg,
                    style: TextStyle(color: Colors.greenAccent[400]),
                    textAlign: TextAlign.center,
                  ),
                ),
                height20Space,
                Padding(
                  padding: const EdgeInsets.all(fixPadding * 2.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.topToBottom,
                          child: SendEtherByWallet(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(7.0),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(fixPadding * 1.7),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: greenColor,
                      ),
                      child: Text(
                        'Okay!',
                        style: white16MediumTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
