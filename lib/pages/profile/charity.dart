import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/profile/add_charity.dart';
import 'package:cryptox/pages/profile/donate.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:cryptox/widget/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Charity extends StatefulWidget {
  const Charity({Key key}) : super(key: key);

  @override
  _CharityState createState() => _CharityState();
}

class _CharityState extends State<Charity> {
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
    {
      'name': 'Women',
      'image': 'assets/women.jpg',
      'value': 'Funds',
      'status': '',
      'change': '',
    }
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color.fromRGBO(26,26,26,1),Color.fromRGBO(226,16,78,1),],),
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
            'Charity',
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
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.size,
                            alignment: Alignment.bottomCenter,
                            child: Donate()));
                  },
                  child: Container(
                    height: 50.0,
                    width: (width - 1.0) / 2,
                    alignment: Alignment.center,
                    child: Text(
                      'Let\'s Donate'.toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: whiteColor.withOpacity(0.7),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.size,
                            alignment: Alignment.bottomCenter,
                            child: AddCharity(false)));
                  },
                  child: Container(
                    height: 50.0,
                    width: (width - 1.0) / 2,
                    alignment: Alignment.center,
                    child: Text(
                      'Add Charities'.toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            height20Space,
            myPortfolio(),
            // myPortfolio1(),
            height20Space,
            privacyPolicy(),
            height20Space,
            termsOfUSe()
          ],
        ),
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
            left: fixPadding * 5.0,
            bottom: fixPadding,
          ),
          child: Text(
            'Categories',
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
                    gradient: LinearGradient(colors: [Colors.purple,Color.fromRGBO(226,16,78,1)]),
                      // color: Colors.blue[800],
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
              );
            },
          ),
        ),
      ],
    );
  }

  privacyPolicy() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Donate as Humanity',
            style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.bold),
          ),
          heightSpace,
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  termsOfUSe() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Purpos of Charity',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          heightSpace,
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}