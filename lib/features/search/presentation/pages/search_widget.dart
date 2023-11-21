import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductSearchPage extends StatefulWidget {
  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  String searchKeyword = ''; // State variable to hold the search keyword
  final CollectionReference productsCollection = FirebaseFirestore.instance.collection('books');
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Search'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter product name',
              labelText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                searchKeyword = value.trim();
              });
            },
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: searchKeyword.isNotEmpty
                  ? productsCollection.where('bookslist',isEqualTo:  searchKeyword).snapshots()
                  : productsCollection.snapshots(),
              builder: (context, snapshot) {
                log(searchKeyword.toString(),name: 'bhjk');
                log(snapshot.data.toString(),name: 'bhjk');
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No products found'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var productData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                      log(productData.toString());
                      return ListTile(
                        title: Text(productData.keys.first),
                        subtitle: Text('Price: \$${productData['price']}'),
                        // Add other product details as needed
                      );
                    },
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
