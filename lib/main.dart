import 'dart:developer';

import 'package:antbery/features/bottonavigation/bloc/bloc/bottomnavigation_bloc.dart';
import 'package:antbery/features/home/data/data_source/remote/book_list_data_source.dart';
import 'package:antbery/features/home/data/repositories/book_list_repositories_iplement.dart';
import 'package:antbery/features/home/presentaion/bloc/bloc/carousel_bloc.dart';

import 'package:antbery/features/home/presentaion/bloc/carousel_index_bloc/carousel_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/home_books/home_books_bloc.dart';
import 'package:antbery/features/splash/presantation/pages/splash.dart';
import 'package:antbery/injectin_containerdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  setUpLocator();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // BookListRemoteDataSourceImpl( ).getBookList();

  runApp(DevicePreview(
    enabled:false,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<CarouselBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<CarouselIndexBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<HomeBooksBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<BottomnavigationBloc>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SplashScreen(),
      ),
    );
  }
}
