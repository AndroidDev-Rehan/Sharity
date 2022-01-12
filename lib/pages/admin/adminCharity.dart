import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/models/charity_model.dart';
import 'package:cryptox/models/daos/all_charities.dart';
import 'package:cryptox/pages/auth/login.dart';
import 'package:cryptox/pages/home/home.dart';
import 'package:cryptox/pages/profile/add_charity.dart';
import 'package:cryptox/pages/profile/donate.dart';
import 'package:cryptox/pages/profile/donate_and_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AdminCharityScreen extends StatefulWidget {
  const AdminCharityScreen({Key key}) : super(key: key);

  @override
  _AdminCharityScreenState createState() => _AdminCharityScreenState();
}

class _AdminCharityScreenState extends State<AdminCharityScreen> {

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
                          onTap: () async{
                            await FirebaseAuth.instance.signOut();
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
            'Charities (Admin Panel)',
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
                    onTap: () => logoutDialog(),

                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         type: PageTransitionType.size,
                    //         alignment: Alignment.bottomCenter,
                    //         child: Donate())
                    // );
                  child: Container(
                    height: 50.0,
                    width: (width - 1.0) / 2,
                    alignment: Alignment.center,
                    child: Text(
                      'LOG OUT'.toUpperCase(),
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
                            child: AddCharity(true)));
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
          child: FutureBuilder(
              future: Provider.of<AllCharities>(context, listen: false).fillCharityList(),
              builder: (context,snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                if (snapshot.hasError) {
                  return Center(child: Text("Error fetching data."));
                }
                return ListView.builder(
                  itemCount: AllCharities.charityList.length,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final item = AllCharities.charityList[index];
                    return PinkCharityWidget(item: item, index: index,);
                  },
                );
              }
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
            'The Purpose of Charity',
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

class PinkCharityWidget extends StatelessWidget {
  const PinkCharityWidget({Key key, this.item, this.index}) : super(key: key);

  final int index;
  final CharityModel item;

  @override
  Widget build(BuildContext context) {
    // return Consumer<AllCharities>(
    //   builder: (context, allCharities, child) {
    return Padding(
      padding: (index != (AllCharities.charityList.length - 1))
//      padding: (index != 2)
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
          child: InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.size,
                      alignment: Alignment.bottomCenter,
                      child: DonateAndDetails(AllCharities.charityList[index])));
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
                        child: Image.network(
                          item.imageUrl,
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    widthSpace,
                    Expanded(
                      child: Text(
                        item.name,
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.clip,
                      ),
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
                          "Funds",
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
//      }
//    );
  }
}

