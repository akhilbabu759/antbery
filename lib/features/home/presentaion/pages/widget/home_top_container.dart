import 'package:antbery/config/them/app_style.dart';

import 'package:antbery/features/home/presentaion/bloc/carousel_bloc/carousel_bloc.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:carousel_slider/carousel_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeTopContainer extends StatelessWidget {
  const HomeTopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              CarouselSlider(
                items: [
                  // Your carousel items go here
                  Container(
                    color: Colors.red,
                    child: Center(
                      child: Text('Item 1'),
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text('Item 2'),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    child: Center(
                      child: Text('Item 3'),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: AppStryle().appSize(context).height * 0.2,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reason) {
                    context.read<CarouselBloc>().add(OnIndexChange(index));
                    // setState(() {
                    //   _currentIndex = index;
                    // });
                  },
                ),
              ),
              Gap(AppStryle().appSize(context).height * 0.025),
              BlocBuilder<CarouselBloc, CarouselState>(
            builder: (context, state) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return Container(
                      width: 12.0,
                      height: 12.0,
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: state.props[0] == index ? Colors.blueAccent : Colors.grey,
                      ),
                    );
                  }),
                );}
              ),
            ],
          )
        ]),
      ),
    );
  }
}
