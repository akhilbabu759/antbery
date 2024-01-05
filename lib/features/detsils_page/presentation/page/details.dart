import 'dart:developer';
import 'dart:ui';

import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/home/domain/entities/book_list_entities.dart';
import 'package:antbery/features/libery_select_page/presentation/page/libery_select_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:quickalert/quickalert.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.model});
  final BookListEntities model;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ProBlackStyle().blackCloProBlack,
    ));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: ProBlackStyle().graywhiteProBlack,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LiberySelectPage(model: model),
            ));
          },
          child: Icon(
            Icons.keyboard_double_arrow_right_sharp,
            size: 30,
            color: Color.fromARGB(246, 179, 214, 162),
          )),
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(242, 195, 194, 194),
                  image: DecorationImage(
                    image: NetworkImage(model.imgUrl),
                    fit: BoxFit.cover,
                  )),
              //   child:ClipRect(
              //     child: Align(
              //       alignment: Alignment.center,
              //       child: Image.network(
              //         model.imgUrl, // Replace with your image URL
              //         fit: BoxFit.contain, // Adjust BoxFit as per your requirement
              //       ),
              //     ) ,

              // )
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 2.0,
                    sigmaY:
                        3.0), // Adjust the sigmaX and sigmaY for blur intensity
                child: Container(
                  color: Colors.transparent,
                ),
              )),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Color.fromARGB(99, 116, 116, 116)),
          ),
          Positioned(
            top: ProBlackStyle().bappSize(context).height * 0.06,
            child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: ProBlackStyle().blackCloProBlack,
                )),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: ProBlackStyle().bappSize(context).width,
              height: ProBlackStyle().bappSize(context).height * 0.7,
              decoration: BoxDecoration(
                  color: ProBlackStyle().grayblackProblack,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Padding(
                padding: EdgeInsets.only(
                    top: ProBlackStyle().bappSize(context).height * 0.1),
                child: Column(children: [
                  Text(
                    model.bookName,
                    style: ProBlackStyle().btextStyle(25.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: ProBlackStyle().bappSize(context).width * 0.05,
                        top: ProBlackStyle().bappSize(context).height * 0.02,
                        bottom:
                            ProBlackStyle().bappSize(context).height * 0.03),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              model.rating.toString(),
                              style: TextStyle(
                                  color: ProBlackStyle().whitecloProBlack,
                                  fontSize:
                                      ProBlackStyle().bappSize(context).width *
                                          0.04),
                            ),
                            Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(5, (index) {
                                  String stringValue = model.rating.toString();
                                  if (index < model.rating.toInt()) {
                                    return Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: ProBlackStyle()
                                              .bappSize(context)
                                              .width *
                                          0.035,
                                    );
                                  } else if (index == (model.rating.toInt()) &&
                                      stringValue.contains('.')) {
                                    List<String> parts = stringValue.split('.');
                                    log(parts.toString(), name: 'rat');
                                    if ((int.parse(parts[1])) >= 1) {
                                      log(int.parse(parts[1]).toString(),
                                          name: 'rat');
                                      log(parts.toString(), name: 'rat');

                                      return Icon(
                                        Icons.star_half_sharp,
                                        color: Colors.amber,
                                        size: ProBlackStyle()
                                                .bappSize(context)
                                                .width *
                                            0.035,
                                      );
                                    } else {
                                      return Icon(
                                        Icons.star_border_outlined,
                                        color: ProBlackStyle().whitecloProBlack,
                                        size: ProBlackStyle()
                                                .bappSize(context)
                                                .width *
                                            0.035,
                                      );
                                    }
                                  } else {
                                    return Icon(
                                      Icons.star_border_outlined,
                                      color: ProBlackStyle().whitecloProBlack,
                                      size: ProBlackStyle()
                                              .bappSize(context)
                                              .width *
                                          0.035,
                                    );
                                  }
                                }))
                          ],
                        ),
                        Gap(ProBlackStyle().bappSize(context).width * 0.06),
                        Column(
                          children: [
                            Text(
                              'Available libery',
                              style: TextStyle(
                                  color: ProBlackStyle().whitecloProBlack,
                                  fontSize:
                                      ProBlackStyle().bappSize(context).width *
                                          0.030),
                            ),
                            Text(model.libery.length.toString(),
                                style: TextStyle(
                                    color: ProBlackStyle().whitecloProBlack,
                                    fontSize: ProBlackStyle()
                                            .bappSize(context)
                                            .width *
                                        0.04)),
                          ],
                        ),
                        Gap(ProBlackStyle().bappSize(context).width * 0.06),
                        Column(
                          children: [
                            Text(
                              "Reader's",
                              style: TextStyle(
                                  color: ProBlackStyle().whitecloProBlack,
                                  fontSize:
                                      ProBlackStyle().bappSize(context).width *
                                          0.030),
                            ),
                            Text(model.libery.length.toString(),
                                style: TextStyle(
                                    color: ProBlackStyle().whitecloProBlack,
                                    fontSize: ProBlackStyle()
                                            .bappSize(context)
                                            .width *
                                        0.04)),
                          ],
                        ),
                        Gap(ProBlackStyle().bappSize(context).width * 0.06),
                        Column(
                          children: [
                            Text(
                              "Share",
                              style: TextStyle(
                                  color: ProBlackStyle().whitecloProBlack,
                                  fontSize:
                                      ProBlackStyle().bappSize(context).width *
                                          0.030),
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.share_rounded,
                                  color: ProBlackStyle().whitecloProBlack,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 13.0,
                      right: 13,
                    ),
                    child: Text(
                      model.description,
                      style: TextStyle(
                          color: ProBlackStyle().whitecloProBlack,
                          fontSize:
                              ProBlackStyle().bappSize(context).width * 0.03),
                    ),
                  )
                ]),
              ),
            ),
          ),
          Positioned(
            top: ProBlackStyle().bappSize(context).height * 0.29,
            right: ProBlackStyle().bappSize(context).width * 0.1,
            child: GestureDetector(
              onTap: () async {
                try {
                  CollectionReference queueCollection =
                      FirebaseFirestore.instance.collection('queue');
                  DocumentReference akhilDoc = queueCollection
                      .doc(FirebaseAuth.instance.currentUser!.email);

                  DocumentSnapshot docSnapshot = await akhilDoc.get();
                  if (!docSnapshot.exists) {
                    // If the document doesn't exist, create it with the list containing the map value
                    await akhilDoc.set({
                      'list': [
                        /* initial map value */ {
                          model.bookName: {
                            'category': model.category,
                            'description': model.description,
                            'image': model.imgUrl,
                            "libery' s": model.libery,
                            'rating': model.rating,
                            'readers': model.readers
                          },
                        }
                      ]
                    });
                    print('Document created successfully');
                  } else {
                    List<dynamic> currentList = (docSnapshot.data()
                            as Map<String, dynamic>?)?['list'] ??
                        [];
                    bool bookExists =
                        currentList.any((map) => map[model.bookName] != null);

                    if (!bookExists) {
                      // Map value to be added to the list
                      Map<String, dynamic> mapValue = {
                        model.bookName: {
                          'category': model.category,
                          'description': model.description,
                          'image': model.imgUrl,
                          "libery' s": model.libery,
                          'rating': model.rating,
                          'readers': model.readers
                        },
                      };

                      // Add the map value to the list
                      currentList.add(mapValue);

                      // Update the 'list' field in the document with the updated list
                      await akhilDoc.update({'list': currentList});

                      print('Map value added to the list successfully');
                      QuickAlert.show(
                          context: context, type: QuickAlertType.success);
                    } else {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'already exists',
                          text: '${model.bookName} already exists in Qeue');
                    }
                  }
                } on FirebaseException catch (e) {
                  log(e.toString(), name: 'njan jackson allada');
                }
              },
              child: Icon(
                Icons.bookmark,
                color: ProBlackStyle().whitecloProBlack,
                size: ProBlackStyle().bappSize(context).width * 0.08,
              ),
            ),
          ),
          Positioned(
            top: ProBlackStyle().bappSize(context).height * 0.16,
            left: ProBlackStyle().bappSize(context).width * 0.36,
            child: SizedBox(
              height: ProBlackStyle().bappSize(context).height * 0.23,
              child: Image.network(model.imgUrl ??
                  'https://m.media-amazon.com/images/I/41RVqoveEpL._SY445_SX342_.jpg'),
            ),
          ),
          // Positioned(
          //     bottom: ProBlackStyle().bappSize(context).height * 0.02,
          //     right: ProBlackStyle().bappSize(context).width * 0.05,
          //     child: Container(
          //       height: ProBlackStyle().bappSize(context).height * 0.07,
          //       width: ProBlackStyle().bappSize(context).width * 0.45,
          //       decoration: BoxDecoration(
          //           color: Color.fromARGB(255, 226, 242, 217),
          //           borderRadius: BorderRadius.circular(30),boxShadow: [BoxShadow(blurRadius: 5,color: ProBlackStyle().whitecloProBlack,spreadRadius: 0.1),BoxShadow(blurRadius: 10,color: ProBlackStyle().grayblackProblack)]),
          //           child: Center(child: Text('Check Now',style: TextStyle(color: Color.fromARGB(255, 8, 108, 13),fontSize: ProBlackStyle().bappSize(context).width * 0.05,fontWeight: FontWeight.w500),)),
          //     ))
        ],
      ),
    );
  }
}
