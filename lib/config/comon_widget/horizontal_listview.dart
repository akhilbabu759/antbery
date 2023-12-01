import 'dart:developer';

import 'package:antbery/config/them/blue_edge_style.dart';
import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/detsils_page/presentation/page/details.dart';
import 'package:antbery/features/home/presentaion/bloc/home_books/home_books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class HorizontalListview extends StatelessWidget {
  const HorizontalListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            return ListView.builder(
              itemCount: len,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                log(state.result[index].imgUrl, name: 'url');

                return GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsPage(model:state.result[index] ),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 3),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.26,
                          height: MediaQuery.of(context).size.height * 0.19,
                          child: Image.network(
                            state.result[index].imgUrl ??
                                'https://m.media-amazon.com/images/I/41RVqoveEpL._SY445_SX342_.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Gap(5),
                        Text(
                          state.result[index].bookName,
                          style: TextStyle(
                              color: Color.fromARGB(255, 160, 160, 160),
                              fontSize:
                                  ProBlackStyle().bappSize(context).width *
                                      0.03),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Text('data');
        },
      ),
    );
  }
}
