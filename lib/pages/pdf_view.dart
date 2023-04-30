import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../models/newsletter.dart';

// ignore: must_be_immutable
class PdfView extends StatelessWidget {
  // int index;
  final NewsletterModel d;

  PdfView( {Key? key,required this.d});
  @override
  Widget build(BuildContext context) {
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
      
        title:Text(d.name!,style:TextStyle(color:Colors.white))
      ),
      body:SfPdfViewer.network(d.pdfUrl!) ,
    );
  }
}
