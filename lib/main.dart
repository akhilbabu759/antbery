import 'dart:developer';

import 'package:antbery/features/home/presentaion/bloc/bloc/carousel_bloc.dart';

import 'package:antbery/features/home/presentaion/bloc/carousel_index_bloc/carousel_bloc.dart';
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
          create: (context) => locator<CarouselIndexBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SplashScreen(),
      ),
    );
  }
}
