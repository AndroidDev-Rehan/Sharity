import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/currencyScreen/crypto_chart_syncfusion_new.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key key}) : super(key: key);

  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  bool watchlist = false;
  final valueController = TextEditingController();
  final amountController = TextEditingController();

  final sellValueController = TextEditingController();
  final sellAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color.fromRGBO(26,26,26,1),Color.fromRGBO(226,16,78,1),]),
                      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Material(
          elevation: 2.0,
          child: Container(
            height: 50.0,
            width: width,
            color: Color.fromRGBO(138,2,164, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => buyBottomSheet(),
                  child: Container(
                    height: 50.0,
                    width: (width - 1.0) / 2,
                    alignment: Alignment.center,
                    child: Text(
                      'Buy'.toUpperCase(),
                      style: white16BoldTextStyle,
                    ),
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: whiteColor.withOpacity(0.5),
                ),
                InkWell(
                  onTap: () => sellBottomSheet(),
                  child: Container(
                    height: 50.0,
                    width: (width - 1.0) / 2,
                    alignment: Alignment.center,
                    child: Text(
                      'Sell'.toUpperCase(),
                      style: white16BoldTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              currencyPriceChart(),
              aboutPortfolio(),
              aboutBtc(),
            ],
          ),
        ),
      ),
    );
  }

  currencyPriceChart() {
    return Container(
      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color.fromRGBO(26,26,26,1),Color.fromRGBO(226,16,78,1),]),
                      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    widthSpace,
                    Text(
                      'USDT',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      watchlist = !watchlist;
                    });
                    if (watchlist) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Added to watchlist'),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Remove from watchlist'),
                      ));
                    }
                  },
                  borderRadius: BorderRadius.circular(18.0),
                  child: Container(
                    width: 36.0,
                    height: 36.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      border: Border.all(
                        width: 0.6,
                        color: Colors.white.withOpacity(1),
                      ),
                    ),
                    child: Icon(
                      (watchlist) ? Icons.star : Icons.star_border,
                      size: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 56.0,
                  width: 56.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    border: Border.all(
                      width: 0.8,
                      color: Colors.white,
                      // color: greyColor.withOpacity(0.5),
                    ),
                  ),
                  child: Image.asset(
                    'assets/crypto_icon/usdt.png',
                    width: 36.0,
                    height: 36.0,
                    fit: BoxFit.cover,
                  ),
                ),
                widthSpace,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current USDT Buy Price',
                      style: TextStyle(color: Colors.white),
                    ),
                    height5Space,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$39,914',
                          style: TextStyle(color: Colors.white),
                        ),
                        widthSpace,
                        Icon(
                          Icons.arrow_drop_up,
                          size: 26.0,
                          color: Colors.white,
                        ),
                        Text(
                          '4.65%',
                          style: primaryColor16MediumTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          height20Space,
          Container(
            width: double.infinity,
            height: 250.0,
            child: CryptoChartSyncfusionNew(),
          ),
        ],
      ),
    );
  }

  aboutPortfolio() {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Portfolio',
            style: TextStyle(color: Colors.white),
          ),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              aboutPortfolioItem('USDT Balance', '5.0107731'),
              aboutPortfolioItem('Current Value', '\$200,005'),
            ],
          ),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              aboutPortfolioItem('Average Buy Price', '\$37,598'),
              Container(
                height: 75.0,
                width: (width - fixPadding * 6.0) / 2,
                padding: EdgeInsets.all(fixPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(colors: [Color.fromRGBO(146, 87,196,1), Colors.deepPurple]), 
                  boxShadow: [ 
                    BoxShadow(
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                      color: blackColor.withOpacity(0.05),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gain/Loss',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_drop_up,
                          size: 26.0,
                          color: Colors.white.withOpacity(1),
                        ),
                        Text(
                          '5.65%',
                          style: primaryColor16BoldTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  aboutPortfolioItem(title, value) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 75.0,
      width: (width - fixPadding * 6.0) / 2,
      padding: EdgeInsets.all(fixPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
       gradient: LinearGradient(colors: [Color.fromRGBO(146, 87,196,1), Colors.deepPurple]),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            spreadRadius: 1.0,
            color: blackColor.withOpacity(0.05),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text( 
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  aboutBtc() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color.fromRGBO(26,26,26,1),Color.fromRGBO(226,16,78,1),]),
      ),
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About USDT',
            style: TextStyle(color: Colors.white),
          ),
          aboutItem('assets/icon/rank.png', 'Market Rank', '#1'),
          aboutItem(
              'assets/icon/market-cap.png', 'Market Cap', '\$75535.74 Cr.'),
          aboutItem(
              'assets/icon/supply.png', 'Circulating Supply', '2 Cr. USDT'),
          height20Space,

          // What is BTC?
          Text(
            'What is USDT?',
            style: TextStyle(color: Colors.white),
          ),
          heightSpace,
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: TextStyle(color: Colors.white),
          ),
          height20Space,
          // Why is the Buy Price and Sell Price different in BTC?
          Text(
            'Why is the Buy Price and Sell Price different in USDT?',
            style: TextStyle(color: Colors.white),
          ),
          heightSpace,
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  aboutItem(iconPath, title, value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    iconPath,
                    width: 16.0,
                    height: 16.0,
                    fit: BoxFit.cover,
                    color: Colors.white,
                  ),
                  width5Space,
                  Text(
                    title,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Text(
                value,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 0.7,
          color: Colors.redAccent.withOpacity(0.4),
        ),
      ],
    );
  }

  void buyBottomSheet() {
    double bitcoinPrice = 39914;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // set this to true
      backgroundColor: Colors.black,
      builder: (BuildContext bc) {
        double width = MediaQuery.of(context).size.width;
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Wrap(
                children: [
                  Container(
                    padding: EdgeInsets.all(fixPadding * 2.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color.fromRGBO(26,26,26,1),Color.fromRGBO(226,16,78,1),]),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width,
                          alignment: Alignment.center,
                          child: Text(
                            'Buy (USDT)',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        height20Space,
                        Container(
                          width: double.infinity,
                          height: 0.7,
                          color: Colors.white,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: fixPadding * 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 56.0,
                                width: 56.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  border: Border.all(
                                    width: 0.8,
                                    color: Colors.white,
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/crypto_icon/usdt.png',
                                  width: 36.0,
                                  height: 36.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              widthSpace,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Current USDT Buy Price',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  height5Space,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '\$39,914',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      widthSpace,
                                      Icon(
                                        Icons.arrow_drop_up,
                                        size: 26.0,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        '4.65%',
                                        style: primaryColor16MediumTextStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Enter Value Textfield
                        Theme(
                          data: ThemeData(
                            primaryColor: Colors.white,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                    color: Color.fromRGBO(29,22,77, 1),
                  ),
                            child: TextField(
                              controller: valueController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Value',
                                labelStyle: TextStyle(color: Colors.white),
                                suffix: Text(
                                  'USD',
                                  style: TextStyle(color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 0.7),
                                ),
                              ),
                              onChanged: (value) {
                                var val = int.parse('${valueController.text}');
                                var amount =
                                    (val / bitcoinPrice).toStringAsFixed(4);
                                setState(() {
                                  amountController.text = '$amount';
                                });
                              },
                            ),
                          ),
                        ),

                        height20Space,

                        // Amount Textfield
                        Theme(
                          data: ThemeData(
                            primaryColor: greyColor,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                    color: Color.fromRGBO(29,22,77, 1),
                  ),
                            child: TextField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Amout',
                                labelStyle: TextStyle(color: Colors.white),
                                suffix: Text(
                                  'USDT',
                                  style: TextStyle(color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 0.7),
                                ),
                              ),
                            ),
                          ),
                        ),
                        height20Space,
                        // Buy Button
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.topToBottom,
                                child: BuySuccessScreen(),
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
                              color: Color.fromRGBO(247,148,30, 1),
                            ),
                            child: Text(
                              'Buy'.toUpperCase(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void sellBottomSheet() {
    double bitcoinPrice = 39914;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // set this to true
      backgroundColor: Colors.black,
      builder: (BuildContext bc) {
        double width = MediaQuery.of(context).size.width;
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Wrap(
                children: [
                  Container(
                    padding: EdgeInsets.all(fixPadding * 2.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color.fromRGBO(26,26,26,1),Color.fromRGBO(226,16,78,1),]),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width,
                          alignment: Alignment.center,
                          child: Text(
                            'Sell (USDT)',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        height20Space,
                        Container(
                          width: double.infinity,
                          height: 0.7,
                          color: Colors.white.withOpacity(0.6),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: fixPadding * 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 56.0,
                                width: 56.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  border: Border.all(
                                    width: 0.8,
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/crypto_icon/usdt.png',
                                  width: 36.0,
                                  height: 36.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              widthSpace,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Current USDT Sell Price',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  height5Space,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '\$39,914',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      widthSpace,
                                      Icon(
                                        Icons.arrow_drop_up,
                                        size: 26.0,
                                        color: Colors.white
                                      ),
                                      Text(
                                        '4.65%',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Enter Value Textfield
                        Theme(
                          data: ThemeData(
                            primaryColor: greyColor,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                    color: Color.fromRGBO(29,22,77, 1),
                  ),
                            child: TextField(
                              controller: sellValueController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Value',
                                labelStyle: TextStyle(color: Colors.white),
                                suffix: Text(
                                  'USD',
                                  style: TextStyle(color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: greyColor, width: 0.7),
                                ),
                              ),
                              onChanged: (value) {
                                var val =
                                    int.parse('${sellValueController.text}');
                                var amount =
                                    (val / bitcoinPrice).toStringAsFixed(4);
                                setState(() {
                                  sellAmountController.text = '$amount';
                                });
                              },
                            ),
                          ),
                        ),

                        height20Space,

                        // Amount Textfield
                        Theme(
                          data: ThemeData(
                            primaryColor: greyColor,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                    color: Color.fromRGBO(29,22,77, 1),
                  ),
                            child: TextField(
                              controller: sellAmountController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Amout',
                                labelStyle: TextStyle(color: Colors.white),
                                suffix: Text(
                                  'USDT',
                                  style: TextStyle(color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: greyColor, width: 0.7),
                                ),
                              ),
                            ),
                          ),
                        ),
                        height20Space,
                        // Buy Button
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.topToBottom,
                                child: BuySuccessScreen(),
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
                              color: Color.fromRGBO(247,148,30, 1),
                            ),
                            child: Text(
                              'Sell'.toUpperCase(),
                              style: white16MediumTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
