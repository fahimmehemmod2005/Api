import 'package:api/api_test_7/model/model.dart';
import 'package:api/api_test_7/services/api_services.dart';
import 'package:api/api_test_7/view/home_view.dart';
import 'package:flutter/material.dart';

class LoginView3 extends StatefulWidget {
  const LoginView3({super.key});

  @override
  State<LoginView3> createState() => _LoginView3State();
}

class _LoginView3State extends State<LoginView3> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RegisterModel registerModel = RegisterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login Screen'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: email,
              decoration: InputDecoration(hintText: 'Enter email'),
            ),
            TextFormField(
              controller: password,
              decoration: InputDecoration(hintText: 'Enter password'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              child: Text('Login'),
              onPressed: () {
                ApiServices7().register(email.text.toString(), password.text.toString()).then((value) {
                      setState(() {
                        registerModel = value!;

                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView7(
                          id: registerModel.id.toString(),
                          token: registerModel.token.toString(),
                        )));
                      });
                    }).onError((error, stackTrace){
                      print(error);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
