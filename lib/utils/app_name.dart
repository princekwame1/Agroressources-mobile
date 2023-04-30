import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppName extends StatelessWidget {
  final double fontSize;
  const AppName({Key? key, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // added this line
      children: [
        Center( // added this widget
          child: Image(image: AssetImage('assets/images/logo1.png'), width: 130.0),
        ),
      ],
    );
  }
}
