import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/account/presentation/page/account.dart';
import 'package:antbery/features/home/presentaion/pages/home.dart';
import 'package:antbery/features/queue/presentation/page/queue.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          'Settings',
          style: TextStyle(color: const Color.fromARGB(255, 242, 242, 242)),
        ),
      ),
      
    );
  }
}