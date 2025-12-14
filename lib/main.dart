
import 'package:api/api_test_5/view/Login_view.dart';
import 'package:api/api_test_6/view/login_view.dart';
import 'package:api/api_test_7/view/login_view.dart';
import 'package:api/api_test_8/view/login_view.dart';
import 'package:api/api_test_9/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api/api_test_4/view/home_view.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Demo Api',
      // home: const HomeView1(),
      // home: const HomeView2(),
      // home: const HomeView3(),
      // home: const HomeView4(),
      //  home: const LoginView1(),
      //  home: const LoginView2(),
      //  home: const LoginView3(),
      //  home: const LoginView4(),
       home: const LoginView5(),
    );
  }
}

