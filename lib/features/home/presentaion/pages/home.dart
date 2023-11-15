import 'dart:developer';

import 'package:antbery/config/them/app_style.dart';
import 'package:antbery/features/home/data/data_source/remote/carousel_data_sourece.dart';
import 'package:antbery/features/home/presentaion/bloc/bloc/carousel_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/home_books/home_books_bloc.dart';
import 'package:antbery/features/home/presentaion/pages/widget/home_grideview.dart';

import 'package:antbery/features/home/presentaion/pages/widget/home_top_container.dart';
import 'package:antbery/features/home/presentaion/pages/widget/horizontal_listview.dart';
import 'package:antbery/injectin_containerdart.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CarouselBloc>().add(OnValueGethanged());
      context.read<HomeBooksBloc>().add(OnBookget());
    });

    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: double.infinity,
            child: Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeTopContainer(),
                    Gap(AppStryle().appSize(context).height * 0.05),
                    GestureDetector(
                      onVerticalDragDown: (details) {},
                      child: Container(
                        width: AppStryle().mainContainerWidth(context),
                        decoration: BoxDecoration(
                            color: AppStryle().bluMin,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gap(20),
                              Text('HOT Reads'),
                              Gap(10),
                              HorizontalListview(),
                              Gap(20),
                              Text('data'),
                              Gap(20),
                              HorizontalListview(),
                              Gap(20),
                              HomeGrideview()
                              
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
