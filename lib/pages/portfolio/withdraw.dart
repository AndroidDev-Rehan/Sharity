import 'package:cryptox/constant/constant.dart';
import 'package:flutter/material.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({Key key}) : super(key: key);

  @override
  _WithdrawState createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  final valueController = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      valueController.text = '10';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color.fromRGBO(26,26,26,1),Color.fromRGBO(226,16,78,1),]),
              )
            ),
        titleSpacing: 0.0,
        title: Text(
          'Withdraw',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color.fromRGBO(26,26,26,1),Color.fromRGBO(226,16,78,1),]),
                      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '\$152',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            height5Space,
            Text(
              'Current Balance',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: fixPadding * 3.0),
            // Amount Textfield Start
            Theme(
              data: ThemeData(
                primaryColor: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(65,65,65, 1),
                    ),
                  child: TextField(
                    controller: valueController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Amout',
                      labelStyle: TextStyle(color: Colors.white),
                      suffix: Text(
                        '\$',
                        style: TextStyle(color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.7),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Amount Textfield End
            height20Space,
            // Amount Suggestion Start
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                amountSuggestionItem(10),
                width20Space,
                amountSuggestionItem(50),
                width20Space,
                amountSuggestionItem(100),
                width20Space,
                amountSuggestionItem(500),
              ],
            ),
            // Amount Suggestion End

            heightSpace,
            Text(
              'Min \$10, Max \$3,000',
              style: TextStyle(color: Colors.white),
            ),

            SizedBox(height: fixPadding * 3.0),

            // Withdraw Button Start
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.circular(5.0),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(fixPadding * 0.7),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color.fromRGBO(138,2,164, 1),
                    ),
                    child: Text(
                      'Withdraw'.toUpperCase(),
                      style: white16MediumTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            // Withdraw Button End
            height5Space,
            Text(
              'Processing time upto 2 days',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  amountSuggestionItem(amount) {
    return InkWell(
      onTap: () {
        setState(() {
          valueController.text = '$amount';
        });
      },
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        padding: EdgeInsets.all(fixPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white.withOpacity(0.2),
        ),
        child: Text(
          '\$$amount',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
