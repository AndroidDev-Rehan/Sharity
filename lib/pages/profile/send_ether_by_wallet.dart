//import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

class SendEtherByWallet extends StatefulWidget {
  SendEtherByWallet({Key key}) : super(key: key);

  @override
  State<SendEtherByWallet> createState() => _SendEtherByWalletState();
}

class _SendEtherByWalletState extends State<SendEtherByWallet> {
  // final String privateKey =
  //     "4f2ffe6228ff950ea89bd38c3a14e7e35c93fbd7fcdda117b7504a9b8ec70ef5";
  //
  // final String receiverAddress = "0x24D02E3aA69Dfd66B5B815f874E3c0AA7b43038e";

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
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Your Wallet Key';
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
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter ether amount you want to send';
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
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the receiver address';
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
                            setState(() {
                              loading = false;
                            });
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

    final String rpcUrl = "https://main-light.eth.linkpool.io";
    final String wsUrl = "ws://main-light.eth.linkpool.io";

    Web3Client client = Web3Client(rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(wsUrl).cast<String>();
    });
    Credentials credentials =
        await client.credentialsFromPrivateKey(privateKey);
    EthereumAddress ownAddress = await credentials.extractAddress();
    EthereumAddress reciever = EthereumAddress.fromHex(receiverAddress);

    try {
      String transactionHash = await client.sendTransaction(
        credentials,
        Transaction(
          to: reciever,
          value: EtherAmount.fromUnitAndValue(EtherUnit.ether, etherValue),
        ),
      );
      TransactionReceipt transactionReceipt =
          await client.getTransactionReceipt(transactionHash);
      bool status = transactionReceipt.status;

      if (status == true) {
        Fluttertoast.showToast(
            msg: 'Transaction was successful',
            // toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.yellow);
      } else {
        Fluttertoast.showToast(
            msg: 'Transaction Failed, please try again later',
            // toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.yellow);
      }
    } on RPCError catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: 'Transaction Failed due to ${e.message}',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.yellow);
    }

    print("sending ether finished!");
  }
}
