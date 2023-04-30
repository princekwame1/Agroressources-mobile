import 'package:flutter/material.dart';
import 'package:news_app/config/config.dart';
import 'package:news_app/pages/welcome.dart';
import 'package:provider/provider.dart';

import '../blocs/sign_in_bloc.dart';
import '../utils/next_screen.dart';
import 'home.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  afterSplash() {
    final SignInBloc sb = context.read<SignInBloc>();
    Future.delayed(Duration(milliseconds: 5000)).then((value) {
      sb.isSignedIn == true || sb.guestUser == true
          ? gotoHomePage()
          : gotoSignInPage();
    });
  }

  gotoHomePage() {
    final SignInBloc sb = context.read<SignInBloc>();
    if (sb.isSignedIn == true) {
      sb.getDataFromSp();
    }
    nextScreenReplace(context, HomePage());
  }

  gotoSignInPage() {
    nextScreenReplace(context, WelcomePage());
  }

  @override
  void initState() {
    afterSplash();
    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //        backgroundColor: const Color.fromARGB(255, 9, 75, 45),
  //       body: Container(
  //         child: Stack(
  //           children: <Widget>[
  //             Align(
  //               alignment: Alignment.center,
  //               child: Image(
  //                 image: AssetImage(Config().splashIcon),
  //                 height: 200,
  //                 width: 250,
  //               ),
  //             ),
  //             Positioned(
  //               bottom: 30.0,
  //               left: 0.0,
  //               right: 0.0,
  //               child: Center(
  //                 child: Text(
  //                   'Powered by Tiastgroup',
  //                   style: TextStyle(
  //                     fontSize: 14.0,
  //                     color: Colors.grey,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       )
        
        
  //       );
  // }


@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 9, 75, 45),
    body: Container(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(Config().splashIcon),
                  height: 200,
                  width: 250,
                ),
                SizedBox(height: 70), // add 70px space
                SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30.0,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: Text(
                'Powered by Tiastgroup',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


}
