import 'package:flutter/material.dart';

class HomeView5 extends StatefulWidget {
  final String token;
  const HomeView5({super.key, required this.token});

  @override
  State<HomeView5> createState() => _HomeView5State();
}

class _HomeView5State extends State<HomeView5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Token: ${widget.token}'),
      ),
    );
  }
}
