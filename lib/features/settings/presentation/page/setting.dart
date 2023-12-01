import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/account/presentation/page/account.dart';
import 'package:antbery/features/home/presentaion/pages/home.dart';
import 'package:antbery/features/queue/presentation/page/queue.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
          'Settings',
          style: TextStyle(color: const Color.fromARGB(255, 242, 242, 242)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              ;
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                tileColor: Color.fromARGB(255, 88, 88, 88),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                leading: Text('Country & language',
                    style:
                        TextStyle(color: Color.fromARGB(255, 236, 236, 236))),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              ;
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                tileColor: Color.fromARGB(255, 88, 88, 88),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                leading: Text('About',
                    style:
                        TextStyle(color: Color.fromARGB(255, 236, 236, 236))),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              ;
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                tileColor: Color.fromARGB(255, 88, 88, 88),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                leading: Text('Custoer Service',
                    style:
                        TextStyle(color: Color.fromARGB(255, 236, 236, 236))),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              ;
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                tileColor: Color.fromARGB(255, 88, 88, 88),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                leading: Text('Privicy Police',
                    style:
                        TextStyle(color: Color.fromARGB(255, 236, 236, 236))),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(child: Center(child: Text('Version 1.0.0',style:
                        TextStyle(color: Color.fromARGB(255, 169, 169, 169)))))
        ]),
      ),
    );
  }
}
