import 'package:api/api_test_4/view/home_view.dart';
import 'package:api/api_test_5/view/Login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'api_test_1/view/home_view.dart';
import 'api_test_2/view/home_view.dart';
import 'api_test_3/view/home_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Demo Api',
      // home: const HomeView1(),
      // home: const HomeView2(),
      // home: const HomeView3(),
      // home: const HomeView4(),
       home: const LoginView1(),
    );
  }
}

