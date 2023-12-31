import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:antbery/blue/auth/presentation/pages/login.dart';
import 'package:antbery/features/bottonavigation/page/bottom_navigation.dart';
import 'package:antbery/features/home/presentaion/bloc/home_books/home_books_bloc.dart';
import 'package:antbery/features/home/presentaion/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBooksBloc>().add(const OnBookget());

    return AnimatedSplashScreen(
      splash: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          Center(
            child: Image.asset(
              'assets/images/antbery logo_bk.png',
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ),
          const Text(
            'antbery.com',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromARGB(255, 147, 147, 147),
                fontStyle: FontStyle.italic),
          )
        ]),
      ),
      nextScreen: const Bottomnavigation(),
      splashIconSize: MediaQuery.of(context).size.height * 0.5,
    );
  }
}
