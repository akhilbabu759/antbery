import 'dart:developer';

import 'package:antbery/config/comon_widget/drawer.dart';
import 'package:antbery/config/them/blue_edge_style.dart';

import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/account/presentation/bloc/bloc/accountdetails_bloc.dart';
import 'package:antbery/features/account/presentation/page/account.dart';
import 'package:antbery/features/auth/login/presentation/page/login.dart';
import 'package:antbery/features/detsils_page/presentation/page/details.dart';

import 'package:antbery/features/home/presentaion/bloc/carousel/carousel_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/financial_bloc/financialbook_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/home_books/home_books_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/other_book/other_book_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/self_book/self_book_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/travel/travelbook_bloc.dart';

import 'package:antbery/features/home/presentaion/pages/widgets/carousel_container.dart';
import 'package:antbery/features/home/presentaion/pages/widgets/other_tabbarview.dart';
import 'package:antbery/features/home/presentaion/pages/widgets/self_tabbarview.dart';
import 'package:antbery/features/home/presentaion/pages/widgets/travel_tabbarview.dart';
import 'package:antbery/features/queue/presentation/page/queue.dart';
import 'package:antbery/features/search/presentation/pages/search_widget.dart';
import 'package:antbery/features/settings/presentation/page/setting.dart';
import 'package:antbery/injectin_containerdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

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
    context.read<FinancialbookBloc>().add(OnFinancialBookget());
    context.read<OtherBookBloc>().add(OnOtherBookget());
    context.read<SelfBookBloc>().add(OnSelfBookget());
    context.read<TravelbookBloc>().add(OnTravelBookget());
    

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
      body: Scrollbar(
        interactive: true,
        thickness: 6,
        child: SafeArea(
          child: Container(
            color: ProBlackStyle().grayblackProblack,
            child: ListView(children: [
              Container(
                color: ProBlackStyle().grayblackProblack,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 14, right: 14),
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
                          height:
                              ProBlackStyle().bappSize(context).height * 0.06,
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
                                    fontSize: ProBlackStyle()
                                            .bappSize(context)
                                            .height *
                                        0.02,
                                    color:
                                        ProBlackStyle().lightBlackcloProBlack,
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
                          Tab(text: 'Finance'),
                          Tab(text: 'Other'),
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
                            SelfTabBarViewWidget(),
                            TravelTabBarViewWidget(),
                            FinancilTabBarViewWidget(),
                            OtherTabBarViewWidget(),
                          ],
                        ),
                      ),

                      // TabBar and TabBarView for the sections
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'All',
                  style: TextStyle(
                      fontSize: 20, color: ProBlackStyle().whitecloProBlack
                      // Additional styling options
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  color: ProBlackStyle().grayblackProblack,
                  child: Expanded(
                    child: BlocBuilder<HomeBooksBloc, HomeBooksState>(
                        builder: (context, state) {
                      log(state.toString(), name: 'satae7');
                      // if(state is HomeBookLoaded){
                      //   return Text('data',style: TextStyle(color: Colors.white),);
                      // }

                      if (state is HommeBookLoading) {
                        log('message');
                        return Center(
                          child: Shimmer.fromColors(
                            baseColor: Color.fromARGB(255, 85, 85, 85),
                            highlightColor: Color.fromARGB(255, 117, 116, 116),
                            period: Duration(seconds: 2),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      const Color.fromARGB(255, 138, 138, 138)),
                              width: double.infinity,
                              height: BlueEdgeStryle().appSize(context).height *
                                  0.23,
                              // Replace this with your desired shimmering content
                            ),
                          ),
                        );
                      }
                      if (state is HomeBookLoaded) {
                        log(state.result[0].imgUrl, name: 'oyee');
                        return GridView.builder(
                            shrinkWrap: true,
                            itemCount: state.result.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, // Number of columns
                                    crossAxisSpacing:
                                        18.0, // Spacing between columns
                                    mainAxisSpacing: 38.0,
                                    childAspectRatio:
                                        14 / 19.5 // Spacing between rows
                                    ),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  FirebaseAuth auth = FirebaseAuth.instance;
                                  if (auth.currentUser != null) {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                          model: state.result[index]),
                                    ));
                                    print('User is signed in!');
                                    print('User ID: ${auth.currentUser!.uid}');
                                    // User is signed in
                                  } else {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => BlLogin(),
                                    ));
                                    // User is not signed in
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10.0, left: 3),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.26,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.19,
                                        child: Image.network(
                                          state.result[index].imgUrl ??
                                              'https://m.media-amazon.com/images/I/41RVqoveEpL._SY445_SX342_.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Gap(5),
                                      Text(
                                        state.result[index].bookName,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 160, 160, 160),
                                            fontSize: ProBlackStyle()
                                                    .bappSize(context)
                                                    .width *
                                                0.03),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Divider(
                                        thickness: 0.8,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      }

                      return Text('data');
                    }),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
