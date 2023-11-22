import 'dart:developer';

import 'package:antbery/config/them/blue_edge_style.dart';
import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/home/data/data_source/remote/carousel_data_sourece.dart';
import 'package:antbery/features/home/presentaion/bloc/bloc/carousel_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/home_books/home_books_bloc.dart';
import 'package:antbery/features/home/presentaion/pages/designs/blue_edge/widget/home_grideview.dart';

import 'package:antbery/features/home/presentaion/pages/designs/blue_edge/widget/home_top_container.dart';
import 'package:antbery/features/home/presentaion/pages/designs/blue_edge/widget/horizontal_listview.dart';
import 'package:antbery/injectin_containerdart.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'designs/blue_edge/blue_edge.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   context.read<CarouselBloc>().add(OnValueGethanged());
    //   context.read<HomeBooksBloc>().add(OnBookget());
    // });
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    void _openDrawer(BuildContext context) {
      _scaffoldKey.currentState?.openDrawer();
    }

    return Scaffold(
        key: _scaffoldKey,
        drawer: dreawerWidget(),
        body: false
            ? BlueEdge(func: _openDrawer)
            : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  children: [
                    Container(
                      height:  ProBlack().appSize(context).height*0.1,
                      decoration: BoxDecoration(color: ProBlack().grayblackProblack
            
                      ),
                    )
                  ],
                ),
            ));
  }
}

