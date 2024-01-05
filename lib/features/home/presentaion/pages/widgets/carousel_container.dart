import 'package:antbery/config/them/blue_edge_style.dart';
import 'package:antbery/config/them/pro_black.dart';

import 'package:antbery/features/home/presentaion/bloc/carousel/carousel_bloc.dart';

import 'package:antbery/features/home/presentaion/bloc/carousel_index_bloc/carousel_bloc.dart';
import 'package:antbery/features/search/presentation/pages/search_widget.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
// import 'package:carousel_slider/carousel_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class CrouselTopContainer extends StatelessWidget {
  const CrouselTopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int len = 0;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          BlocBuilder<CarouselBloc, CarouselState>(builder: (context, stat) {
            if (stat is CarouseLoading) {
              return Center(
                child: Shimmer.fromColors(
                  baseColor: const Color.fromARGB(255, 85, 85, 85),
                  highlightColor: Color.fromARGB(255, 135, 134, 134),
                  period: Duration(seconds: 2),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 138, 138, 138)),
                    width: double.infinity,
                    height: ProBlackStyle().bappSize(context).height * 0.24,
                    // Replace this with your desired shimmering content
                  ),
                ),
              );
            }
            if (stat is CarouseLoaded) {
              len = stat.result.length;

              return CarouselSlider(
                items: stat.result.map((e) {
                  return Container(
                      height: ProBlackStyle().bappSize(context).height * 0.15,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Image.network(
                        e.img_url,
                        fit: BoxFit.fill,
                      ));
                }).toList(),
                options: CarouselOptions(
                  aspectRatio: 16 / 9, // Set your desired aspect ratio here
                  viewportFraction:
                      1.0, // Ensure the carousel takes the full width
                  enlargeCenterPage: false,
                  enableInfiniteScroll: true,
                  height: ProBlackStyle().bappSize(context).height * 0.25,

                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reason) {
                    context.read<CarouselIndexBloc>().add(OnIndexChange(index));
                    // setState(() {
                    //   _currentIndex = index;
                    // });
                  },
                ),
              );
            }
            return Text('');
          }),
          Gap(BlueEdgeStryle().appSize(context).height * 0.025),
          BlocBuilder<CarouselIndexBloc, CarouseIndexlState>(
              builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(len, (index) {
                return Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: state.props[0] == index
                        ? ProBlackStyle().whitecloProBlack
                        : Colors.grey,
                  ),
                );
              }),
            );
          }),
        ],
      ),
    );
  }
}
