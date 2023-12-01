import 'package:antbery/config/comon_widget/drawer.dart';

import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/account/presentation/page/account.dart';
import 'package:antbery/features/home/presentaion/bloc/bloc/carousel_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/home_books/home_books_bloc.dart';

import 'package:antbery/features/home/presentaion/pages/widgets/carousel_container.dart';
import 'package:antbery/features/queue/presentation/page/queue.dart';
import 'package:antbery/features/search/presentation/pages/search_widget.dart';
import 'package:antbery/features/settings/presentation/page/setting.dart';
import 'package:antbery/injectin_containerdart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';

import 'designs/blue_edge/blue_edge.dart';
import 'widgets/tabbar_view_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    context.read<CarouselBloc>().add(OnValueGethanged());
    context.read<HomeBooksBloc>().add(OnBookget());

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ProBlackStyle().blackCloProBlack,
    ));
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    void _openDrawer(BuildContext context) {
      _scaffoldKey.currentState?.openDrawer();
    }

    return Scaffold(
      key: _scaffoldKey,
      //drawer: DreawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: ProBlackStyle().grayblackProblack,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 14, right: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(10),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ProductSearchPage(),
                      ),
                    ),
                    child: Container(
                      height: ProBlackStyle().bappSize(context).height * 0.06,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ProBlackStyle().graywhiteProBlack,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              color: ProBlackStyle().lightBlackcloProBlack,
                            ),
                            Text(
                              'Search',
                              style: TextStyle(
                                fontSize:
                                    ProBlackStyle().bappSize(context).height *
                                        0.02,
                                color: ProBlackStyle().lightBlackcloProBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Gap(20),
                  TabBar(
                    indicatorColor: ProBlackStyle().whitecloProBlack,
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 4,
                          color: Colors.white, // Indicator color
                        ),
                        insets: EdgeInsets.symmetric(horizontal: 16)),
                    controller: _tabController,
                    tabs: [
                      Tab(text: 'Self Help'),
                      Tab(text: 'Travel'),
                      Tab(text: 'New'),
                      Tab(text: 'Finance'),
                    ],
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white54,
                  ),
                  Divider(
                    color: ProBlackStyle().grayblackProblack,
                  ),

                  const CrouselTopContainer(),

                  Gap(10),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        TabBarViewWidget(),
                        TabBarViewWidget(),
                        TabBarViewWidget(),
                        TabBarViewWidget(),
                      ],
                    ),
                  ),

                  // TabBar and TabBarView for the sections
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
