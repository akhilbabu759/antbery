import 'dart:developer';

import 'package:antbery/config/comon_widget/horizontal_listview.dart';
import 'package:antbery/config/them/blue_edge_style.dart';
import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/detsils_page/presentation/page/details.dart';
import 'package:antbery/features/home/presentaion/bloc/home_books/home_books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class TabBarViewWidget extends StatelessWidget {
  const TabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hot Reads',
          style: TextStyle(fontSize: 20, color: ProBlackStyle().whitecloProBlack
              // Additional styling options
              ),
        ),
        Gap(10),
        HorizontalListview(),
        Gap(30),
        Text(
          'All',
          style: TextStyle(fontSize: 20, color: ProBlackStyle().whitecloProBlack
              // Additional styling options
              ),
        ),
        Gap(10),
        Expanded(
          child: Homegrideview(),
        )
      ],
    );
  }
}

class Homegrideview extends StatelessWidget {
  const Homegrideview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBooksBloc, HomeBooksState>(
        builder: (context, state) {
      log(state.toString(), name: 'satae090');
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
      
      if(state is HomeBookLoaded){
       return GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 18.0, // Spacing between columns
                mainAxisSpacing: 38.0,
                childAspectRatio: 14 / 19.5 // Spacing between rows
                ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(model: state.result[index]),
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
                                ProBlackStyle().bappSize(context).width * 0.03),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              );
            });
      }
      return Text('data');
    });
  }
}
