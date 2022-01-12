//
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class PhoneAuth{
//
//   PhoneAuth._();
//
//   bool otpSent = false;
//
// //  static bool present;
//   static PhoneAuth _phoneAuth;
//
//   static PhoneAuth getPhoneAuth() {
//     if (_phoneAuth == null)
//       {
//         _phoneAuth = PhoneAuth._();
//       }
//     return _phoneAuth;
//   }
//
//   //  void sendOTP(String phoneNumber ) async {
//   //   await FirebaseAuth.instance.verifyPhoneNumber(
//   //       phoneNumber: phoneNumber,
//   //       verificationCompleted: verificationCompleted,
//   //       verificationFailed: verificationFailed,
//   //       codeSent: codeSent,
//   //       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//   // }
//
//   void codeAutoRetrievalTimeout(String verificationId) {
// //       _verificationId = verificationId;
//        otpSent = true;
//   }
//
//   void codeSent(String verificationId, [int a]) {
// //    setState(() {
//       _verificationId = verificationId;
//       otpSent = true;
// //    });
//   }
//
//   void verificationFailed(FirebaseAuthException exception) {
//     Fluttertoast.showToast(msg: "There is some error.Please Try again Later");
// //    setState(() {
// //      isLoggedIn = false;
//       otpSent = false;
// //    });
//   }
//
//   void verificationCompleted(PhoneAuthCredential credential) async {
//     await FirebaseAuth.instance.signInWithCredential(credential);
//     if (FirebaseAuth.instance.currentUser != null) {
// //      setState(() {
// //        isLoggedIn = true;
// //        uid = FirebaseAuth.instance.currentUser.uid;
// //      });
//     } else {
//       print("Failed to Sign In");
//     }
//   }
//
//   // String validatePhoneNumber(String phoneNo){
//   //   String correctPhNo = phoneNo;
//   //   if (phoneNo.startsWith("+92"))
//   //     return phoneNo;
//   //   else if(phoneNo.startsWith("92")){
//   //     return "+$correctPhNo";
//   //   }
//   //   else if (phoneNo.startsWith('0')){
//   //     return correctPhNo.replaceFirst('0', '+92');
//   //   }
//   //   return phoneNo;
//   // }
//
// }