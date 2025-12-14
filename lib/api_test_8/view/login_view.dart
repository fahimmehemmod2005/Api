import 'package:api/api_test_8/services/api_services.dart';
import 'package:flutter/material.dart';

class LoginView4 extends StatefulWidget {
  const LoginView4({super.key});

  @override
  State<LoginView4> createState() => _LoginView4State();
}

class _LoginView4State extends State<LoginView4> {

  dynamic userDetail;
  bool isLoading = false;

  getUserDatils() {
    setState(() {
      isLoading = true;
    });
    ApiServices8().getUserDetails().then((value) {
      print('userDetail ==> ${value.toString()}');
      setState(() {
        userDetail = value;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  @override
  void initState() {
    getUserDatils();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Http Api Header'),
          centerTitle: true,
          backgroundColor: Color(0xFFD500F9),
        ),
      body: Center(
        child: isLoading == true
            ? CircularProgressIndicator()
            : SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: ${userDetail['id'].toString()}'),
                Text('Email: ${userDetail['email'].toString()}'),
                Text(userDetail['password'].toString()),
                Text(userDetail['name'].toString()),
                Text(userDetail['role'].toString()),
                CircleAvatar(child: Image.network(userDetail['avatar']),),
                Text(userDetail['creationAt'].toString()),
                Text(userDetail['updatedAt'].toString()),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
