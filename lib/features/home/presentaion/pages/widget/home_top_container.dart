import 'package:antbery/config/them/app_style.dart';
import 'package:antbery/features/home/presentaion/bloc/bloc/carousel_bloc.dart';

import 'package:antbery/features/home/presentaion/bloc/carousel_index_bloc/carousel_bloc.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:carousel_slider/carousel_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class HomeTopContainer extends StatelessWidget {
  const HomeTopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int len = 0;
    return Container(
      height: AppStryle().appSize(context).height * 0.35,
      width: AppStryle().mainContainerWidth(context),
      decoration: BoxDecoration(
          color: AppStryle().bluMin,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: AppStryle().whiteCle,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: AppStryle().whiteCle,
                  )),
            ],
          ),
          Column(
            children: [
              BlocBuilder<CarouselBloc, CarouselState>(
                  builder: (context, stat) {
                if (stat is CarouseLoading) {
                  return Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: const Color.fromARGB(255, 249, 233, 233)!,
                      period: Duration(seconds: 2),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 138, 138, 138)),
                        width: AppStryle().appSize(context).height * 0.45,
                        height: AppStryle().appSize(context).height * 0.20,
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
                          height: AppStryle().appSize(context).height * 0.15,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Image.network(
                            e.img_url,
                            fit: BoxFit.fill,
                          ));
                    }).toList(),
                    options: CarouselOptions(
                      height: AppStryle().appSize(context).height * 0.2,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      onPageChanged: (index, reason) {
                        context
                            .read<CarouselIndexBloc>()
                            .add(OnIndexChange(index));
                        // setState(() {
                        //   _currentIndex = index;
                        // });
                      },
                    ),
                  );
                }
                return Text('');
              }),
              Gap(AppStryle().appSize(context).height * 0.025),
              BlocBuilder<CarouselIndexBloc, CarouseIndexlState>(
                  builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(len, (index) {
                    return Container(
                      width: 12.0,
                      height: 12.0,
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: state.props[0] == index
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                    );
                  }),
                );
              }),
            ],
          )
        ]),
      ),
    );
  }
}
