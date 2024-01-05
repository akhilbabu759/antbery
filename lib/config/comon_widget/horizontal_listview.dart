import 'dart:developer';

import 'package:antbery/config/them/blue_edge_style.dart';
import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/auth/login/presentation/page/login.dart';
import 'package:antbery/features/detsils_page/presentation/page/details.dart';
import 'package:antbery/features/home/domain/entities/book_list_entities.dart';
import 'package:antbery/features/home/domain/entities/financial_book_entities.dart';
import 'package:antbery/features/home/presentaion/bloc/home_books/home_books_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HorizontalListview extends StatelessWidget {
  const HorizontalListview({
    super.key,
    required this.data,
  });
  final List<dynamic> data;

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return SizedBox(
      height: BlueEdgeStryle().appSize(context).height * 0.23,
      width: double.infinity,
      child: BlocBuilder<HomeBooksBloc, HomeBooksState>(
        builder: (context, state) {
          log(state.toString(), name: 'satae7');
          if (state is HommeBookLoading) {
            return Center(
              child: Shimmer.fromColors(
                baseColor: Color.fromARGB(255, 85, 85, 85),
                highlightColor: Color.fromARGB(255, 117, 116, 116),
                period: Duration(seconds: 2),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 138, 138, 138)),
                  width: double.infinity,
                  height: BlueEdgeStryle().appSize(context).height * 0.23,
                  // Replace this with your desired shimmering content
                ),
              ),
            );
          }
          if (state is HomeBookLoaded) {
            int len = state.result.length;
            List<BookListEntities> filter = [];

            for (BookListEntities i in state.result) {
              for (int j = 0; j < data.length; j++) {
                log('${i.bookName.trim()}+${data[j]}', name: 'kooop');
                if (i.bookName.trim() == data[j].trim()) {
                  filter.add(i);
                }
              }
            }
            log(filter.toString(), name: 'jnjnhjh');
            void _scrollToPosition() {
              _scrollController.animateTo(
                300.0, // Set the position to scroll to (change this value as needed)
                duration: Duration(
                    milliseconds:
                        500), // Set the duration of the scroll animation
                curve: Curves.ease, // Set the curve of the scroll animation
              );
            }

            return Stack(
              children: [
                ListView.builder(
                  controller: _scrollController,
                  itemCount: filter.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    log(filter[index].imgUrl, name: 'url');

                    return GestureDetector(
                      onTap: () {
                       FirebaseAuth auth = FirebaseAuth.instance;
                                  if (auth.currentUser != null) {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                          model: filter[index]),
                                    ));
                                    print('User is signed in!');
                                    print('User ID: ${auth.currentUser!.uid}');
                                    // User is signed in
                                  } else {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => BlLogin(),
                                    ));
                                    // User is not signed in
                                  }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.26,
                              height: MediaQuery.of(context).size.height * 0.19,
                              child: Image.network(
                                filter[index].imgUrl ??
                                    'https://m.media-amazon.com/images/I/41RVqoveEpL._SY445_SX342_.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                            const Gap(5),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.28,
                              child: Center(
                                child: Text(
                                  filter[index].bookName,
                                  style: TextStyle(
                                      color: const Color.fromARGB(255, 160, 160, 160),
                                      fontSize:ProBlackStyle()
                                              .bappSize(context)
                                              .width *
                                          0.03),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                    right: 0,
                    width: MediaQuery.of(context).size.width * 0.05,
                    child: Container(
                      height: BlueEdgeStryle().appSize(context).height * 0.19,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(108, 116, 116, 116)),
                      child: GestureDetector(
                          onTap: () {
                            _scrollToPosition();
                          },
                          child: Icon(Icons.arrow_forward_ios)),
                    ))
              ],
            );
          }
          return Text('data');
        },
      ),
    );
  }
}
