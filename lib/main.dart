import 'package:flutter/material.dart';
import 'package:travel_app/navigation_pages/main_page.dart';
import 'package:travel_app/pages/detail_page.dart';
import 'package:travel_app/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const DetailPage(),
    );
  }
}


