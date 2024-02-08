import 'package:e_commerce_app/views/screens/detail_page.dart';
import 'package:e_commerce_app/views/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home_page',
        routes: {
          'home_page': (context) => const HomePage(),
          'detail_page': (context) => const DetailPage(),
        },
        home: const HomePage(),
      );
    }
  }
