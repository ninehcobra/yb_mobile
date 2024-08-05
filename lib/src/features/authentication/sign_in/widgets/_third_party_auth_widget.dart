import 'package:flutter/material.dart';
import 'package:yb_mobile/src/common/widgets/custom_logo_button.dart';

class ThirdPartyAuthWidget extends StatelessWidget {
  final thirdPartyData = ThirdPartyData().data;
  ThirdPartyAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: thirdPartyData.length,
        itemBuilder: (context, index) => CustomLogoButton(
            logoUrl: thirdPartyData[index].logoUrl,
            logoHoveredUrl: thirdPartyData[index].logoHoveredUrl,
            title: thirdPartyData[index].title,
            hoveredColor: thirdPartyData[index].hoveredColor),
      ),
    );
  }
}

class ThirdPartyData {
  final data = const <ThirdPartyItem>[
    ThirdPartyItem(
        logoUrl: "assets/icons/facebook_normal.png",
        logoHoveredUrl: "assets/icons/facebook_light.png",
        title: "Login with Facebook",
        hoveredColor: Color(0xFF1877F2)),
    ThirdPartyItem(
        logoUrl: "assets/icons/gmail_normal.png",
        logoHoveredUrl: "assets/icons/gmail_light.png",
        title: "Login with Gmail",
        hoveredColor: Color(0xFFF34237)),
    ThirdPartyItem(
        logoUrl: "assets/icons/twitter_normal.png",
        logoHoveredUrl: "assets/icons/twitter_light.png",
        title: "Login with Twitter",
        hoveredColor: Color(0xFF03A9F4))
  ];
}

class ThirdPartyItem {
  final String logoUrl;
  final String logoHoveredUrl;
  final String title;
  final Color hoveredColor;

  const ThirdPartyItem(
      {required this.logoUrl,
      required this.logoHoveredUrl,
      required this.title,
      required this.hoveredColor});
}
