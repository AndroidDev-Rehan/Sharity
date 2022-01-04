//import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:websocket/websocket.dart';
import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

class SendEtherByWallet extends StatelessWidget {
  const SendEtherByWallet({Key key}) : super(key: key);
  final String privateKey = "68402edf2df6a2342338f2e6f7e0e2a65203a455b94564b0d2eecc37762fe823";
  final String receiverAddress = "0x766F7540CFA51489e135Ca22cAC32866456b4389";
  final int etherValue = 20;

  // final connector = WalletConnect(
  //   bridge: 'https://bridge.walletconnect.org',
  //   clientMeta: PeerMeta(
  //     name: 'WalletConnect',
  //     description: 'WalletConnect Developer App',
  //     url: 'https://walletconnect.org',
  //     icons: [
  //       'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
  //     ],
  //   ),
  // );


  @override
  Widget build(BuildContext context) {
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
            'Bank Details',
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
        body: ListView(
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
                      child: TextField(
                        // style: black14MediumTextStyle,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                          fillColor: Color.fromRGBO(29,22,77, 1),
                          filled: true,
                          labelText: 'Enter Your Wallet Key',
                          labelStyle: TextStyle(color: Colors.white),
                          suffix: Text(
                            'USDT',
                            style: TextStyle(color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor, width: 0.7),
                          ),
                        ),
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
                      child: TextField(
                        // style: black14MediumTextStyle,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                          fillColor: Color.fromRGBO(29,22,77, 1),
                          filled: true,
                          labelText: 'Enter Amount in ETH',
                          labelStyle: TextStyle(color: Colors.white),
                          suffix: Text(
                            'ETH',
                            style: TextStyle(color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor, width: 0.7),
                          ),
                        ),
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
                      child: TextField(
                        // style: black14MediumTextStyle,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                          fillColor: Color.fromRGBO(29,22,77, 1),
                          filled: true,
                          labelText: 'Enter the reciever address',
                          labelStyle: TextStyle(color: Colors.white),
                          suffix: Text(
                            'USDT',
                            style: TextStyle(color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor, width: 0.7),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
            height20Space,
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
              child: InkWell(
                onTap: () async {
                  await sendEther();
                },
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color.fromRGBO(138,2,164, 1),
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
      ),
    );
  }

   sendEther() async{

    final String rpcUrl = "HTTP://192.168.0.107:7545";
    final String wsUrl = "ws://192.168.0.107:7545";
    Web3Client client = Web3Client(rpcUrl, Client() , socketConnector: () {
      return IOWebSocketChannel.connect(wsUrl).cast<String>();
    } );
    Credentials credentials = await client.credentialsFromPrivateKey(privateKey);
    EthereumAddress ownAddress = await credentials.extractAddress();
    EthereumAddress reciever = EthereumAddress.fromHex(receiverAddress);
    client.sendTransaction(
      credentials,
      Transaction(to: reciever,
        value: EtherAmount.fromUnitAndValue(EtherUnit.ether, etherValue)),
    );
    print("sending ether finished!");
  }
}



