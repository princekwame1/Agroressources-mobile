import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news_app/widgets/html_body.dart';
import 'package:easy_localization/easy_localization.dart';

import '../models/notification.dart';
import '../services/app_service.dart';

class CustomNotificationDeatils extends StatelessWidget {
  const CustomNotificationDeatils({Key? key, required this.notificationModel})
      : super(key: key);

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    final String dateTime = Jiffy(notificationModel.date).fromNow();
    return Scaffold(
      appBar: AppBar(
                  flexibleSpace: FlexibleSpaceBar(
    background: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:[
            Color.fromARGB(255, 9, 75, 45),
              Color.fromRGBO(80, 159, 104, 1),
                  Color.fromRGBO(121, 187, 91, 1),
               Color.fromRGBO(121, 187, 91, 1),
             Color.fromRGBO(80, 159, 104, 1),
          ],
          transform:GradientRotation(90)
      
        ),
      ),
    ),
  ),
      
        title: Text('notification details',style: TextStyle(color:Colors.white)).tr(),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  AntDesign.clockcircleo,
                  size: 16,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  dateTime,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).secondaryHeaderColor,),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              AppService.getNormalText(notificationModel.title!),
              style: TextStyle(
                  fontFamily: 'Manrope',
                  wordSpacing: 1,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 2,
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            HtmlBodyWidget(
                content: notificationModel.description!,
                isVideoEnabled: true,
                isimageEnabled: true,
                isIframeVideoEnabled: true),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
