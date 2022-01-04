import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class TopGainer extends StatefulWidget {
  const TopGainer({Key key}) : super(key: key);

  @override
  _TopGainerState createState() => _TopGainerState();
}

class _TopGainerState extends State<TopGainer> {
  final topGainerList = [
    {
      'name': 'Tether',
      'shortName': 'USDT',
      'image': 'assets/crypto_icon/usdt.png',
      'value': '\$0.262855',
      'status': 'up',
      'change': '8.95%'
    },
    {
      'name': 'Ethereum',
      'shortName': 'ETH',
      'image': 'assets/crypto_icon/eth.png',
      'value': '\$71.24',
      'status': 'up',
      'change': '7.12%'
    },
    {
      'name': 'Tether',
      'shortName': 'USDT',
      'image': 'assets/crypto_icon/usdt.png',
      'value': '\$10,136.73',
      'status': 'up',
      'change': '6.72%'
    },
    {
      'name': 'Ethereum',
      'shortName': 'ETH',
      'image': 'assets/crypto_icon/eth.png',
      'value': '\$185.65',
      'status': 'up',
      'change': '6.23%'
    },
    {
      'name': 'Tether',
      'shortName': 'USDT',
      'image': 'assets/crypto_icon/usdt.png',
      'value': '\$297.98',
      'status': 'up',
      'change': '4.55%'
    },
    {
      'name': 'Tether Coin',
      'shortName': 'USDT',
      'image': 'assets/crypto_icon/usdt.png',
      'value': '\$27.11',
      'status': 'up',
      'change': '3.43%'
    },
    {
      'name': 'Tether',
      'shortName': 'USDT',
      'image': 'assets/crypto_icon/usdt.png',
      'value': '\$1.23',
      'status': 'up',
      'change': '1.58%'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: topGainerList.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final item = topGainerList[index];
        return Padding(
          padding: (index != topGainerList.length - 1)
              ? EdgeInsets.fromLTRB(
                  fixPadding * 2.0, fixPadding * 2.0, fixPadding * 2.0, 0.0)
              : EdgeInsets.all(fixPadding * 2.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.size,
                      alignment: Alignment.center,
                      child: CurrencyScreen()));
            },
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              padding: EdgeInsets.all(fixPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                 gradient: LinearGradient(colors: [Color.fromRGBO(179,135,24,1),Color.fromRGBO(254,250,55, 1),]),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    color: Colors.white.withOpacity(0.05),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    item['image'],
                    height: 50.0,
                    width: 50.0,
                    fit: BoxFit.cover,
                  ),
                  widthSpace,
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  item['shortName'],
                                  style: TextStyle(color: Colors.white),
                                ),
                                widthSpace,
                                (item['status'] == 'up')
                                    ? Icon(
                                        Icons.arrow_drop_up,
                                        color: primaryColor,
                                      )
                                    : Icon(
                                        Icons.arrow_drop_down,
                                        color: redColor,
                                      ),
                                Text(
                                  item['change'],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          item['value'],
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
