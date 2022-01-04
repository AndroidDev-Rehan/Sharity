import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/profile/donate.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:cryptox/widget/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final portfolioItem = [
    {
      'name': 'Paralytic',
      'image': 'assets/para.jpg',
      'value': 'Funds',
      'status': '',
      'change': '',
    },
    {
      'name': 'Poor Child',
      'image': 'assets/poor.jpg',
      'value': 'Funds',
      'status': '',
      'change': '',
    },
    {
      'name': 'Schools',
      'image': 'assets/school.jpg',
      'value': 'Funds',
      'status': '',
      'change': '',
    },
  ];

  final popularCurrencyList = [
    {
      'name': 'Tether',
      'shortName': 'USDT',
      'image': 'assets/crypto_icon/usdt.png',
      'value': '\$10,136.73',
      'status': 'up',
      'change': '4.72%'
    },
    {
      'name': 'Ethereum',
      'shortName': 'ETH',
      'image': 'assets/crypto_icon/eth.png',
      'value': '\$185.65',
      'status': 'up',
      'change': '6.86%'
    },
    {
      'name': 'Ethereum',
      'shortName': 'ETH',
      'image': 'assets/crypto_icon/eth.png',
      'value': '\$0.262855',
      'status': 'down',
      'change': '8.95%'
    },
    {
      'name': 'Tether Cash',
      'shortName': 'USDT',
      'image': 'assets/crypto_icon/usdt.png',
      'value': '\$297.98',
      'status': 'up',
      'change': '4.55%'
    },
    {
      'name': 'Ethereum',
      'shortName': 'ETH',
      'image': 'assets/crypto_icon/eth.png',
      'value': '\$71.24',
      'status': 'up',
      'change': '7.12%'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.purple,Color.fromRGBO(226,16,78,1),Color.fromRGBO(26,26,26,1),],),
              ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            userGreeting(),
            balanceContainer(),
            height20Space,
            myPortfolio(),
            height20Space,
            popularCurrency(),
          ],
        ),
      ),
    );
  }

  userGreeting() {
    return Padding(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
              ),
              heightSpace,
              Text(
                'Peter Jones',
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomBar(index: 4),
                ),
              );
            },
            borderRadius: BorderRadius.circular(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                'assets/user/user_14.jpg',
                width: 60.0,
                height: 60.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  balanceContainer() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        gradient: LinearGradient(colors: [Color.fromRGBO(179,135,24,1),Color.fromRGBO(254,250,55, 1),]),
        // color: Colors.blue[800],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Funds',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          heightSpace,
          Text(
            '\$4,50,933',
            style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          height20Space,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Monthly profit',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  heightSpace,
                  Text(
                    '\$12,484',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(fixPadding * 0.7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: whiteColor.withOpacity(0.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_drop_up,
                      size: 26.0,
                      color: whiteColor,
                    ),
                    Text(
                      '+10%',
                      style: TextStyle(color: Colors.blue[200], fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  myPortfolio() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: fixPadding * 2.0,
            bottom: fixPadding,
          ),
          child: Text(
            'Charities',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          width: double.infinity,
          height: 178.0,
            child: ListView.builder(
              itemCount: portfolioItem.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = portfolioItem[index];

                return Padding(
                  padding: (index != portfolioItem.length - 1)
                      ? EdgeInsets.only(left: fixPadding * 2.0)
                      : EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: Container(
                      width: 220.0,
                      padding: EdgeInsets.all(fixPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(colors: [Color.fromRGBO(179,135,24,1),Color.fromRGBO(254,250,55, 1),]),
                        // color: Colors.blue[800],
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                            color: blackColor.withOpacity(0.05),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.size,
                            alignment: Alignment.bottomCenter,
                            child: Donate()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 50.0,
                                child: ClipRRect(
                                  child: Image.asset(
                                  item['image'],
                                  width: 100.0,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                ),
                                widthSpace,
                                Text(
                                  item['name'],
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                heightSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      item['value'],
                                      style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          // ),
        ),
      ],
    );
  }

  popularCurrency() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Popular Currencies',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomBar(index: 2),
                    ),
                  );
                },
                child: Text(
                  'See More',
                  style: primaryColor16MediumTextStyle,
                ),
              ),
            ],
          ),
        ),
        ColumnBuilder(
          itemCount: popularCurrencyList.length,
          itemBuilder: (context, index) {
            final item = popularCurrencyList[index];
            return Padding(
              padding: (index != popularCurrencyList.length - 1)
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
        ),
      ],
    );
  }
}
