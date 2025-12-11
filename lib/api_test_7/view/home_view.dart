import 'package:flutter/material.dart';

class HomeView7 extends StatefulWidget {
  final String? id, token;
  const HomeView7({super.key, this.id, this.token});

  @override
  State<HomeView7> createState() => _HomeView7State();
}

class _HomeView7State extends State<HomeView7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Screen'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID:${widget.id}'),
            Text('Token: ${widget.token}'),
          ],
        ),
      ),
    );
  }
}
