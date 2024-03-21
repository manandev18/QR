import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String QrResult ='Scanned Data will appear here';
  Future<void> scanQR()async{
    try{
      final qrcode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'cancel', true,ScanMode.QR)
      if(!mounted)return ;
      setState(() {
        this.QrResult = qrcode.toString();
      });
    }on PlatformException{
      qrResult = 'Failed to read QR code'
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan QR Code')),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 30,),
        Text('$QrResult'.style: TextStyle(color: Colors.black),),
        SizedBox(height: 30,),
        ElevatedButton(onPressed: scanQR, child: Text('Scan Code'))
      ],),)
    );
  }
}