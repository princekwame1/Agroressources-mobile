// import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:news_app/blocs/newsletter_bloc.dart';
import 'package:news_app/pages/pdf_view.dart';
import 'package:news_app/utils/cached_image_with_dark.dart';
import 'package:news_app/utils/empty.dart';
import 'package:news_app/utils/loading_cards.dart';
import 'package:provider/provider.dart';

import '../models/newsletter.dart';

class Newsletter extends StatefulWidget {
  Newsletter({Key? key}) : super(key: key);

  @override
  _NewsletterState createState() => _NewsletterState();

  static fromFirestore(DocumentSnapshot<Object?> e) {}
}

class _NewsletterState extends State<Newsletter>
    with AutomaticKeepAliveClientMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController? controller;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 0)).then((value) {
      controller = new ScrollController()..addListener(_scrollListener);
      context.read<NewsletterBloc>().getData(mounted);
    });
  }

  @override
  void dispose() {
    controller!.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    final db = context.read<NewsletterBloc>();

    if (!db.isLoading) {
      if (controller!.position.pixels == controller!.position.maxScrollExtent) {
        context.read<NewsletterBloc>().setLoading(true);
        context.read<NewsletterBloc>().getData(mounted);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final cb = context.watch<NewsletterBloc>();

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
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text('Agroressources Newsletters',style: TextStyle(color:Colors.white)).tr(),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Feather.rotate_cw,
              size: 22,
              color:Colors.white,
            ),
            onPressed: () {
              context.read<NewsletterBloc>().onRefresh(mounted);
            },
          )
        ],
      ),
      body: RefreshIndicator(
        child: cb.hasData == false
            ? ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  EmptyPage(
                      icon: Feather.clipboard,
                      message: 'no newsletter found',
                      message1: ''),
                ],
              )
            : GridView.builder(
                controller: controller,
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 20 / 30,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: cb.data.length != 0 ? cb.data.length + 1 : 10,
                itemBuilder: (_, int index) {
                  if (index < cb.data.length) {
                    return _ItemList(d: cb.data[index]);
                  }
                  return Opacity(
                    opacity: cb.isLoading ? 1.0 : 0.0,
                    child: cb.lastVisible == null
                        ? LoadingCard(height: null)
                        : Center(
                            child: SizedBox(
                                width: 32.0,
                                height: 32.0,
                                child: new CupertinoActivityIndicator()),
                          ),
                  );
                },
              ),
        onRefresh: () async {
          context.read<NewsletterBloc>().onRefresh(mounted);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ItemList extends StatelessWidget {
  final NewsletterModel d;
  const _ItemList({Key? key, required this.d}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0, 3),
                    color: Theme.of(context).shadowColor)
              ]),
          child: Card(
            child: Stack(
              children: [
                Hero(
                  tag: 'newsletter${d.timestamp}',
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: CustomCacheImageWithDarkFilterBottom(
                        imageUrl: d.thumbnailUrl, radius: 5.0),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 15, bottom: 15, right: 10),
                    child: Text(
                      d.name!,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.6),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Get.to(() => PdfView(d: d));
        });
  }
}
