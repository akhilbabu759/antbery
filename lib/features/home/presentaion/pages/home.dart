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
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    void _openDrawer(BuildContext context) {
      _scaffoldKey.currentState?.openDrawer();
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppStryle().bluMin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: AppStryle().appSize(context).width * 0.11,
                    backgroundImage: NetworkImage(
                        'https://artriva.com/media/k2/items/cache/c889234799e865bbe90cee71f6cd2e53_XL.jpg'),
                  ),
                  // Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  //   image: DecorationImage(
                  // image: NetworkImage('https://artriva.com/media/k2/items/cache/c889234799e865bbe90cee71f6cd2e53_XL.jpg'), // Replace with your image path
                  // fit: BoxFit.cover,
                  // colorFilter: ColorFilter.mode(
                  //   Colors.black.withOpacity(0.5), // Adjust opacity here
                  //   BlendMode.srcOver,
                  // )
                  // )),
                  //   child: Text(
                  //     'Akhil',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 24,
                  //     ),
                  //   ),
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Akhil',
                        style: AppStryle().textStyle(
                            AppStryle().appSize(context).width * 0.05),
                      ),
                      Gap(8),
                      Text(
                        'akhilb4001@gmail.com',
                        style: TextStyle(
                            color: AppStryle().whitegrayCle,
                            fontSize:
                                AppStryle().appSize(context).width * 0.02),
                      )
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // Implement profile functionality here
                Navigator.pop(context);
                // Add your code to navigate or perform actions related to profile
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Implement settings functionality here
                Navigator.pop(context);
                // Add your code to navigate or perform actions related to settings
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                // Implement about functionality here
                Navigator.pop(context);
                // Add your code to navigate or perform actions related to about
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text('Contact'),
              onTap: () {
                // Implement contact functionality here
                Navigator.pop(context);
                // Add your code to navigate or perform actions related to contact
              },
            ),
          ],
        ),
      ),
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
                    HomeTopContainer(fun: _openDrawer),
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
                              Text(
                                'HOT Reads',
                                style: TextStyle(
                                    color: AppStryle().whiteCle,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                              Gap(10),
                              HorizontalListview(),
                              Gap(20),
                              Text('Recent',
                                  style: TextStyle(
                                      color: AppStryle().whiteCle,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic)),
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
