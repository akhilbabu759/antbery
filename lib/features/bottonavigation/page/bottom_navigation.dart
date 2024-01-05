import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/account/presentation/bloc/bloc/accountdetails_bloc.dart';
import 'package:antbery/features/account/presentation/page/account.dart';
import 'package:antbery/features/auth/login/presentation/page/login.dart';
import 'package:antbery/features/bottonavigation/bloc/bloc/bottomnavigation_bloc.dart';
import 'package:antbery/features/home/domain/entities/book_list_entities.dart';
import 'package:antbery/features/home/presentaion/bloc/carousel_index_bloc/carousel_bloc.dart';
import 'package:antbery/features/home/presentaion/pages/home.dart';
import 'package:antbery/features/queue/presentation/bloc/bloc/queue_book_bloc.dart';
import 'package:antbery/features/queue/presentation/page/queue.dart';
import 'package:antbery/features/settings/presentation/page/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bottomnavigation extends StatelessWidget {
  const Bottomnavigation({super.key, });


  @override
  Widget build(BuildContext context) {
    List<Widget> widg = [
      Home(),
      QueuePage(),
      Account(),
      Settings()
    ];
    return Scaffold(
      body: BlocBuilder<BottomnavigationBloc, BottomnavigationState>(
        builder: (context, state) {
          if (state is BottoLoading) {
            return widg[state.bottomIndex];
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomnavigationBloc, BottomnavigationState>(
              builder: (context, state) {
        if (state is BottoLoading) {
          return BottomNavigationBar(
            selectedItemColor: Color.fromARGB(255, 140, 140, 140),
            backgroundColor: ProBlackStyle().blackCloProBlack,
            unselectedItemColor: ProBlackStyle().graywhiteProBlack,
            currentIndex: state.bottomIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.queue),
                label: 'Queue',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            onTap: (int index) {
              FirebaseAuth auth = FirebaseAuth.instance;
              if (auth.currentUser != null) {
                if(index==2){
                  context.read<AccountdetailsBloc>().add(OnValueChaneg());
                }
                if(index==1){
                  context.read<QueueBookBloc>().add(OnQueueGet());
                }
                context.read<BottomnavigationBloc>().add(OnIndexChangeb(index));
                print('User is signed in!');
                print('User ID: ${auth.currentUser!.uid}');
                // User is signed in
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlLogin(),
                ));
                // User is not signed in
              }

              // if(index==0){
              //    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(),));
              // }
              // if(index==1){
              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => QueuePage(),));
              // }
              //  if(index==2){
              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Account(),));
              // }
              //  if(index==3){
              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Settings(),));
              // }
            },
          );
        }
        return Text('');
      }),
    );
  }
}
