import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code/pages/web_qr_code.dart';

import '../adsense/adsense.dart';

class HomeQrCode extends StatefulWidget {
  const HomeQrCode({Key? key}) : super(key: key);

  @override
  State<HomeQrCode> createState() => _HomeQrCodeState();
}

class _HomeQrCodeState extends State<HomeQrCode> {
  String link = '';

  readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
      false,
      ScanMode.QR,
    );
    setState(() => link = code != '-1' ? code : 'Link Inválido');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: readQRCode,
                      icon: const Icon(Icons.qr_code),
                      label: const Text('Ler Qr Code'),
                    ),
                    const SizedBox(height: 50),
                    if (link != '')
                      Text(
                        'LINK: $link',
                        style:
                            const TextStyle(fontSize: 21, color: Colors.black),
                      ),
                    const SizedBox(height: 10),
                    WebQrCode(texto: link),
                  ],
                ),
              ),
            ],
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: AdSense(adScreen: AdSense.homeScreen),
          ),
        ],
      ),
    );
  }
}
