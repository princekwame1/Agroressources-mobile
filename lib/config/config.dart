import 'package:flutter/material.dart';

class Config {
  final String appName = 'Agroressources';
  final String splashIcon = 'assets/images/logo1.png';
  final String supportEmail = 'agroressourcesmedia@gmail.com';
  final String privacyPolicyUrl = 'https://agro-ressources.com';
  final String ourWebsiteUrl = 'https://agro-ressources.com';
  final String iOSAppId = '000000';

  //social links
  static const String facebookPageUrl = 'https://www.facebook.com/profile.php?id=100090175562441';
  static const String youtubeChannelUrl =
      'https://www.youtube.com/@agrorichestv6163';
  static const String twitterUrl =
      'https://twitter.com/agroriches?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor';

  //app theme color
  final Color appColor = Color.fromARGB(255, 9, 75, 45);

  //Intro images
  final String introImage1 = 'assets/images/news1.gif';
  final String introImage2 = 'assets/images/news6.gif';
  final String introImage3 = 'assets/images/news7.gif';

  //animation files
  final String doneAsset = 'assets/animation_files/done.json';

  //Language Setup
  final List<String> languages = ['English', 'Chinese', 'French'];

  //initial categories - 4 only (Hard Coded : which are added already on your admin panel)
  final List initialCategories = [
    'Actualités',
    'Articles',
    'Trendances',
    'Arts et nutrition'
  ];
}
