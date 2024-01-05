import 'dart:developer';

import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/account/presentation/page/account.dart';
import 'package:antbery/features/home/presentaion/pages/home.dart';
import 'package:antbery/features/queue/presentation/bloc/bloc/queue_book_bloc.dart';
import 'package:antbery/features/settings/presentation/page/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class QueuePage extends StatelessWidget {
  const QueuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProBlackStyle().grayblackProblack,
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: ProBlackStyle().grayblackProblack,
        // leading: GestureDetector(
        //   child: Icon(
        //     Icons.arrow_back_ios,
        //     color: ProBlackStyle().whitecloProBlack,
        //   ),
        // ),
        centerTitle: true,
        title: Text(
          'Queue',
          style: TextStyle(color: const Color.fromARGB(255, 242, 242, 242)),
        ),
      ),
      body:
          BlocBuilder<QueueBookBloc, QueueBookState>(builder: (context, state) {
        log(state.toString(), name: 'satae7');
        // if(state is HomeBookLoaded){
        //   return Text('data',style: TextStyle(color: Colors.white),);
        // }

        if (state is QueueLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is QueueLoaded) {
         return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Expanded(
                child: GridView.builder(
                    itemCount: state.result.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Number of columns
                        crossAxisSpacing: 18.0, // Spacing between columns
                        mainAxisSpacing: 38.0,
                        childAspectRatio: 14 / 16.5 // Spacing between rows
                        ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 125, 125, 125),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 125, 125, 125)),
                              BoxShadow(
                                  color: Color.fromARGB(255, 156, 156, 156),
                                  spreadRadius: 0.1,
                                  blurRadius: 2,
                                  blurStyle: BlurStyle.solid,
                                  offset: Offset(0.4, 1))
                            ]),
                        child: Column(
                          children: [
                            SizedBox(
                              height:
                                  ProBlackStyle().bappSize(context).width * 0.3,
                              width: ProBlackStyle().bappSize(context).width *
                                  0.27,
                              child: Image.network(state.result[index].imgUrl
                                //'https://m.media-amazon.com/images/I/51Hfv2MfNGL._SY445_SX342_.jpg'
                                ,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Gap(5),
                            Text(
                              state.result[index].bookName,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 233, 233, 233),
                                  fontSize:
                                      ProBlackStyle().bappSize(context).width *
                                          0.023,
                                  overflow: TextOverflow.ellipsis),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ]),
          );
        }return Text('');
      }),
    );
  }
}
