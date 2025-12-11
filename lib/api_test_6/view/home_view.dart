import 'package:flutter/material.dart';

class HomeView6 extends StatefulWidget {
  final String? name, job, id, createAt;
  const HomeView6({super.key, this.name, this.job, this.id, this.createAt});

  @override
  State<HomeView6> createState() => _HomeView6State();
}

class _HomeView6State extends State<HomeView6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Job'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name: ${widget.name}'),
          Text('Job: ${widget.job}'),
          Text('Id: ${widget.id}'),
          Text('createdAt: ${widget.createAt}'),

        ],
      ),
    );
  }
}
