import 'dart:developer';

import 'package:antbery/config/them/pro_black.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductSearchPage extends StatefulWidget {
  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  String searchKeyword = ''; // State variable to hold the search keyword
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('books');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProBlackStyle().grayblackProblack,
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: ProBlackStyle().grayblackProblack,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: ProBlackStyle().whitecloProBlack,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(color: const Color.fromARGB(255, 242, 242, 242)),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(style: TextStyle(color: Color.fromARGB(255, 225, 225, 225)),
              decoration: InputDecoration(focusColor:Color.fromARGB(255, 150, 150, 149),
                fillColor: const Color.fromARGB(255, 150, 150, 149),
                filled: true,
               
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
              ),
              onChanged: (value) {
                setState(() {
                  searchKeyword = value.trim();
                });
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: searchKeyword.isNotEmpty
                  ? productsCollection
                      .where('bookslist', isEqualTo: searchKeyword)
                      .snapshots()
                  : productsCollection.snapshots(),
              builder: (context, snapshot) {
                log(searchKeyword.toString(), name: 'bhjk');
                log(snapshot.data.toString(), name: 'bhjk');
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No products found'));
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.builder(
                        itemCount: 10,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Number of columns
                            crossAxisSpacing: 18.0, // Spacing between columns
                            mainAxisSpacing: 38.0,
                            childAspectRatio: 14 / 16.5 // Spacing between rows
                            ),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 125, 125, 125),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          Color.fromARGB(255, 125, 125, 125)),
                                  BoxShadow(
                                      color: Color.fromARGB(255, 156, 156, 156),
                                      spreadRadius: 0.1,
                                      blurRadius: 2,
                                      blurStyle: BlurStyle.solid,
                                      offset: Offset(0.4, 1))
                                ]),
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      ProBlackStyle().bappSize(context).width *
                                          0.3,
                                  width:
                                      ProBlackStyle().bappSize(context).width *
                                          0.27,
                                  child: Image.network(
                                    'https://m.media-amazon.com/images/I/51Hfv2MfNGL._SY445_SX342_.jpg',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                Gap(5),
                                Text(
                                  'Rich dad poor dad',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 233, 233, 233),
                                      fontSize: ProBlackStyle()
                                              .bappSize(context)
                                              .width *
                                          0.023,
                                      overflow: TextOverflow.ellipsis),
                                )
                              ],
                            ),
                          );
                        }),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
