import 'package:antbery/config/them/app_style.dart';
import 'package:antbery/features/home/presentaion/pages/widget/home_top_container.dart';
import 'package:antbery/features/home/presentaion/pages/widget/horizontal_listview.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const HomeTopContainer(),
        Gap(AppStryle().appSize(context).height * 0.05),
        Expanded(
          child: GestureDetector(onVerticalDragDown: (details) {
            
          },
            child: Container(
              width: AppStryle().mainContainerWidth(context),
              decoration: BoxDecoration(
                  color: AppStryle().bluMin,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(50))),
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
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                        Radius.circular(20),
                        
                      ),color: AppStryle().whitegrayCle,),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
