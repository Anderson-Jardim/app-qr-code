import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdSense extends StatefulWidget {
  final int adScreen;
  static const homeScreen = 1;
  static const settinsgsScreen = 2;

  const AdSense({key, required this.adScreen});

  @override
  State<AdSense> createState() => _AdSenseState();
}

class _AdSenseState extends State<AdSense> {
  BannerAd? _myBanner;

  @override
  void initState() {
    _myBanner = BannerAd(
        size: AdSize.banner,
        adUnitId: _getAdId(widget.adScreen),
        request: const AdRequest(),
        listener: const BannerAdListener());
    _myBanner?.load();    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _myBanner!.size.width.toDouble(),
      height: _myBanner!.size.height.toDouble(),
      child: AdWidget(ad: _myBanner!),
    );
  }

  String _getAdId(int screen) {
    switch (screen) {
      case AdSense.homeScreen:
        return 'ca-app-pub-1367063668197166/7099940443';
      default:
        return '';
    }
  }
}
