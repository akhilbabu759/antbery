import 'dart:developer';

import 'package:antbery/config/them/app_style.dart';
import 'package:antbery/features/home/presentaion/bloc/home_books/home_books_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HomeGrideview extends StatelessWidget {
  const HomeGrideview({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeBooksBloc,HomeBooksState>(
                                  builder: (context, state) {
                                    
                                    log(state.toString(),name: 'state');
                                if(state is HommeBookLoading) {
                                  return Center(
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: const Color.fromARGB(
                                          255, 249, 233, 233)!,
                                      period: Duration(seconds: 2),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color.fromARGB(
                                                255, 138, 138, 138)),
                                        width: double.infinity,
                                        height: AppStryle()
                                                .appSize(context)
                                                .height *
                                            0.23,
                                        // Replace this with your desired shimmering content
                                      ),
                                    ),
                                  );
                                }
                                if(state is HomeBookLoaded) {
                                  int len = state.result.length;
                                 return Container(
                                    height: AppStryle()
                                                .appSize(context)
                                                .height >=
                                            837
                                        ? AppStryle().appSize(context).height *
                                            0.75
                                        : AppStryle().appSize(context).height *
                                            0.6,
                                    width: AppStryle().appSize(context).width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      color: AppStryle().whitegrayCle,
                                    ),
                                    child: GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: AppStryle()
                                                .appSize(context)
                                                .height *
                                            0.14 /
                                            (AppStryle()
                                                    .appSize(context)
                                                    .height *
                                                0.14) *
                                            0.8,
                                        crossAxisCount:
                                            3, // Number of columns in the grid
                                        crossAxisSpacing:
                                            4.0, // Spacing between columns
                                        mainAxisSpacing:
                                            3.0, // Spacing between rows
                                      ),
                                      itemCount: len,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Image.network(state.result[index].imgUrl??
                                              'https://m.media-amazon.com/images/I/41RVqoveEpL._SY445_SX342_.jpg',
                                              fit: BoxFit.fill),
                                        );
                                      },
                                    ),
                                  );
                                }
                                
                           
                                return Center(
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: const Color.fromARGB(
                                          255, 249, 233, 233)!,
                                      period: Duration(seconds: 2),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color.fromARGB(
                                                255, 138, 138, 138)),
                                        width: double.infinity,
                                        height: AppStryle()
                                                .appSize(context)
                                                .height *
                                            0.23,
                                        // Replace this with your desired shimmering content
                                      ),
                                    ),
                                  );
                              });
  }
}