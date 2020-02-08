import 'dart:async';

import 'package:buktam_scan/page/success_page.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';

class ScanPage extends StatefulWidget{
  @override
  _scanPageState createState() => _scanPageState();

}

class _scanPageState extends State<ScanPage>{
  GlobalKey qrKey = GlobalKey();
  String qrText;
  QRViewController controller;

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreate(QRViewController controller){
    this.controller = controller;
    controller.scannedDataStream.listen((scanData){

      controller.pauseCamera();

      setState(() {
        qrText = scanData;
      });

      _setTimer();

      controller.resumeCamera();
    });
  }

  Future<Timer> _setTimer() async {
    showDialog(context: context, builder: (context) => SuccessPage());

    return Timer(Duration(seconds: 2, milliseconds: 500), _onDoneLoading);
  }

  Future<void> _onDoneLoading() async {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRView(
            key: qrKey,
            overlay: QrScannerOverlayShape(
              borderRadius: 10,
              borderColor: Colors.red,
              borderLength:10,
              borderWidth:10,
              cutOutSize:300,
            ),
            onQRViewCreated: _onQRViewCreate,
          ),
//          FlareActor(
//            'assets/success.flr',
//            alignment: Alignment.center,
//            animation: 'success'
//          ),
        ],
      ),
    );
  }
}