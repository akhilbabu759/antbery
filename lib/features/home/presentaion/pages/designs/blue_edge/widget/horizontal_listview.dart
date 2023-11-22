


import 'dart:developer';

import 'package:antbery/config/them/blue_edge_style.dart';
import 'package:antbery/features/home/presentaion/bloc/home_books/home_books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          log(state.toString(),name: 'satae7');
           if (state is HommeBookLoading) {
                  return Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: const Color.fromARGB(255, 249, 233, 233)!,
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
          return ListView.builder(itemCount: len,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              log(state.result[index].imgUrl,name: 'url');

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(state.result[index].imgUrl??
                  'https://m.media-amazon.com/images/I/41RVqoveEpL._SY445_SX342_.jpg'
                  ,
                  fit: BoxFit.fitHeight,
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
