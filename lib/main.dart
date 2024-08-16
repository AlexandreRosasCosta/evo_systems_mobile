import 'package:evo_systems_mobile/utils/constants.dart';
import 'package:evo_systems_mobile/page/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EvoSystems',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Constants.backgroundColor,
      ),
      home: const HomePage(),
    );
  }
}