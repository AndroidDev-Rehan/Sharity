import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/models/daos/all_charities.dart';
import 'package:cryptox/pages/admin/adminCharity.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if(FirebaseAuth.instance.currentUser != null)
    {
      print("user id is uid: ${FirebaseAuth.instance.currentUser.uid}\n"
          "phone number: ${FirebaseAuth.instance.currentUser.phoneNumber}"
      );
    }

    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(ChangeNotifierProvider(
      create: (_) => AllCharities(),
      child : MyApp()
    ));
  });
}


class MyApp extends StatelessWidget {



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sharity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        fontFamily: 'Montserrat',
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: primaryColor,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: greyColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: SplashScreen(),
    );
  }
}
