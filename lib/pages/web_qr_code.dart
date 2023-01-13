import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebQrCode extends StatefulWidget {
  WebQrCode({super.key, required this.texto});

  String? texto;

  @override
  State<WebQrCode> createState() => _WebQrCodeState();
}

class _WebQrCodeState extends State<WebQrCode> {
  String? _url() {
    String toLaunch;
    try {
      widget.texto;
      return toLaunch = '${widget.texto}';
    } catch (e) {
      print(e);
    }
  }

  Future<void> _launchInBrowser() async {
    String? url = widget.texto;
    if (url != null && url != '') {
      if (!await launchUrl(
        Uri.parse(_url() ?? ''),
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch $url';
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Faça a leitura do QRCode!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _launchInBrowser,
      icon: const Icon(Icons.link),
      label: const Text('Acessar Link'),
    );
  }
}
