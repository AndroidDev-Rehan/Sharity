import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptox/models/charity_model.dart';
import 'package:flutter/cupertino.dart';

class AllCharities extends ChangeNotifier{
  static List<CharityModel> charityList;

  // static Future<AllCharities> create() async {
  //   var allCharities = AllCharities._create();
  //   await allCharities.fillCharityList();
  //   return allCharities;
  // }
  //
  // AllCharities._create();

  Future<void> fillCharityList() async{
    final db = FirebaseFirestore.instance;
    final QuerySnapshot<Map<String,dynamic>> collection = await db.collection('charities').get();
    charityList = collection.docs.map(
            (doc) => CharityModel.fromMap(doc.data())
    ).toList();
  }

  // List<CharityModel> getList(){
  //   return charityList;
  // }

  Future<void> insertCharity(CharityModel charity) async{
    charityList.add(charity);
    // await FirebaseFirestore.instance.collection('charities').add(charity.toMap());
    await FirebaseFirestore.instance.collection('charities').doc(charity.cid).set(charity.toMap());

//    notifyListeners();
  }


}