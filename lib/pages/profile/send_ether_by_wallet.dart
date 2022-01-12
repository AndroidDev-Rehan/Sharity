//import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:cryptox/pages/profile/EtherTransferSuccess.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wallet_connect/models/exception/exceptions.dart';
import 'package:web3dart/json_rpc.dart';
import 'package:web_socket_channel/io.dart';
//import 'package:websocket/websocket.dart';
import 'package:cryptox/constant/constant.dart';
//import 'package:cryptox/pages/screens.dart';
import 'package:flutter/material.dart';

//import 'package:page_transition/page_transition.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

import 'EtherTransferFail.dart';

class SendEtherByWallet extends StatefulWidget {
  SendEtherByWallet({Key key}) : super(key: key);

  @override
  State<SendEtherByWallet> createState() => _SendEtherByWalletState();
}

class _SendEtherByWalletState extends State<SendEtherByWallet> {

  String privateKey;
  String receiverAddress;


  int etherValue;
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController privateKeyField = TextEditingController();
    TextEditingController recieverAddressField = TextEditingController();
    TextEditingController etherAmountField = TextEditingController();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(26, 26, 26, 1),
          Color.fromRGBO(226, 16, 78, 1),
        ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(26, 26, 26, 1),
              Color.fromRGBO(226, 16, 78, 1),
            ]),
          )),
          titleSpacing: 0.0,
          title: Text(
            'Transfer Ether',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: loading
            ? Center(child: CircularProgressIndicator())
            : Form(
                child: ListView(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          height20Space,
                          Padding(
                            padding: EdgeInsets.only(right: 20.0, left: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    spreadRadius: 1.0,
                                    color: blackColor.withOpacity(0.05),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty || (value.toString().length != 64)) {
                                    return 'Enter a valid wallet key';
                                  }
                                  return null;
                                },
                                // style: black14MediumTextStyle,
                                keyboardType: TextInputType.text,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.5)),
                                  fillColor: Color.fromRGBO(29, 22, 77, 1),
                                  filled: true,
                                  labelText: 'Enter Your Wallet Key',
                                  labelStyle: TextStyle(color: Colors.white),
                                  // suffix: Text(
                                  //   'USDT',
                                  //   style: TextStyle(color: Colors.white),
                                  // ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: greyColor, width: 0.7),
                                  ),
                                ),
                                controller: privateKeyField,
                              ),
                            ),
                          ),
                          height20Space,
                          Padding(
                            padding: EdgeInsets.only(right: 20.0, left: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    spreadRadius: 1.0,
                                    color: blackColor.withOpacity(0.05),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty ) {
                                    return 'Enter ether amount you want to send';
                                  }
                                  return null;
                                },
                                // style: black14MediumTextStyle,
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.5)),
                                  fillColor: Color.fromRGBO(29, 22, 77, 1),
                                  filled: true,
                                  labelText: 'Enter Amount in ETH',
                                  labelStyle: TextStyle(color: Colors.white),
                                  suffix: Text(
                                    'ETH',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: greyColor, width: 0.7),
                                  ),
                                ),
                                controller: etherAmountField,
                              ),
                            ),
                          ),
                          height20Space,
                          Padding(
                            padding: EdgeInsets.only(right: 20.0, left: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    spreadRadius: 1.0,
                                    color: blackColor.withOpacity(0.05),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty || (value.toString().length != 42)) {
                                    return 'Please enter a valid receiver address';
                                  }
                                  return null;
                                },
                                // style: black14MediumTextStyle,
                                keyboardType: TextInputType.text,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.5)),
                                  fillColor: Color.fromRGBO(29, 22, 77, 1),
                                  filled: true,
                                  labelText: 'Enter the reciever address',
                                  labelStyle: TextStyle(color: Colors.white),
                                  // suffix: Text(
                                  //   'USDT',
                                  //   style: TextStyle(color: Colors.white),
                                  // ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: greyColor, width: 0.7),
                                  ),
                                ),
                                controller: recieverAddressField,
                              ),
                            ),
                          ),
                        ]),
                    height20Space,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding * 2.0),
                      child: InkWell(
                        onTap: () async {
                          if (_formKey.currentState.validate()){
                            privateKey = privateKeyField.text.toString();
                            receiverAddress = recieverAddressField.text.toString();
                            etherValue = int.parse(etherAmountField.text.toString());
                            print("private key is $privateKey\n"
                                "receiver address is $receiverAddress\n"
                                "ether amount is $etherValue\n"
                            );
                            setState(() {
                              loading = true;
                            });
                            await sendEther();
                          }
                        },
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color.fromRGBO(138, 2, 164, 1),
                          ),
                          child: Text(
                            'Donate',
                            style: white14BoldTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                key: _formKey,
              ),
      ),
    );
  }

  sendEther() async {
    // final String rpcUrl = "https://rinkeby-light.eth.linkpool.io";
    // final String wsUrl = "wss://rinkeby-light.eth.linkpool.io/ws";

    final String rpcUrl = "https://mainnet.infura.io/v3/7deac362a6f748f9a30270d47e9c4b3c";
    final String wsUrl = "wss://mainnet.infura.io/ws/v3/7deac362a6f748f9a30270d47e9c4b3c";

    Web3Client client = Web3Client(rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(wsUrl).cast<String>();
    });
    Credentials credentials =
        await client.credentialsFromPrivateKey(privateKey);

    try {
//      EthereumAddress ownAddress = await credentials.extractAddress();
      EthereumAddress receiver = EthereumAddress.fromHex(receiverAddress);
      EthereumAddress feeReceiver = EthereumAddress.fromHex("0xC412B5B4Ae0F4790963983Bf459EE9C1d08044b4");

//      final BigInt enteredAmountinWie = BigInt.from(1000000000000000000*etherValue);
      final BigInt etherAmountinWie  =  BigInt.from(1000000000000000000*etherValue-(1000000000000000000*etherValue*0.03));
      final BigInt gasFeeAmount = BigInt.from(1000000000000000000*etherValue*0.03);

      String transactionHash = await client.sendTransaction(
        credentials,
        Transaction(
          to: receiver,
          value: EtherAmount.fromUnitAndValue(EtherUnit.wei, etherAmountinWie),
        ),
      );


      await client.sendTransaction(
        credentials,
        Transaction(
          to: feeReceiver,
          value: EtherAmount.fromUnitAndValue(EtherUnit.ether, gasFeeAmount),
        ),
      );

      TransactionReceipt transactionReceipt =
          await client.getTransactionReceipt(transactionHash);
      bool status = transactionReceipt.status;

      if (status == true) {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.topToBottom,
            child: EtherTransferSuccessScreen("Transaction was Successful."),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.topToBottom,
            child: EtherTransferFailScreen("Transaction failed, Please try again later."),
          ),
        );
      }
    }
    on RPCError catch (e) {
      print(e);
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.topToBottom,
          child: EtherTransferFailScreen("Transaction Failed due to ${e.message}"),
        ),
      );
    }
    catch (ej) {
      print(ej.message);
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.topToBottom,
          child: EtherTransferFailScreen("Transaction Failed. Invalid private key or reciever address"),
        ),
      );
    }
    print("sending ether finished!");
  }
}
