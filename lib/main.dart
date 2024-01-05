import 'dart:developer';

import 'package:antbery/blue/auth/presentation/pages/login.dart';
import 'package:antbery/features/account/presentation/bloc/bloc/accountdetails_bloc.dart';
import 'package:antbery/features/auth/login/presentation/page/login.dart';

import 'package:antbery/features/auth/sinup/presentaion/bloc/image_pic/image_pick_bloc.dart';
import 'package:antbery/features/auth/sinup/presentaion/bloc/signup/signup_bloc.dart';
import 'package:antbery/features/bottonavigation/bloc/bloc/bottomnavigation_bloc.dart';
import 'package:antbery/features/home/data/data_source/remote/book_list_data_source.dart';
import 'package:antbery/features/home/data/repositories/book_list_repositories_iplement.dart';

import 'package:antbery/features/home/presentaion/bloc/carousel/carousel_bloc.dart';

import 'package:antbery/features/home/presentaion/bloc/carousel_index_bloc/carousel_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/financial_bloc/financialbook_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/home_books/home_books_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/other_book/other_book_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/self_book/self_book_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/travel/travelbook_bloc.dart';
import 'package:antbery/features/queue/presentation/bloc/bloc/queue_book_bloc.dart';
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
    enabled: false,
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
          lazy: false,
          create: (_) => locator<HomeBooksBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<BottomnavigationBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<FinancialbookBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<OtherBookBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<SelfBookBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<TravelbookBloc>(),
        ),
        BlocProvider(create: (_) => locator<ImagePickBloc>()),
        BlocProvider(create: (_) => locator<SignupBloc>()),
        BlocProvider(create: (_) => locator<AccountdetailsBloc>()),
        BlocProvider(create: (_) => locator<QueueBookBloc>())
        
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SplashScreen(),
      ),
    );
  }
}
