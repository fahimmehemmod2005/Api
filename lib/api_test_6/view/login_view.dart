import 'package:api/api_test_6/model/model.dart';
import 'package:api/api_test_6/services/api_services.dart';
import 'package:api/api_test_6/view/home_view.dart';
import 'package:flutter/material.dart';

class LoginView2 extends StatefulWidget {
  const LoginView2({super.key});

  @override
  State<LoginView2> createState() => _LoginView2State();
}

class _LoginView2State extends State<LoginView2> {
  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();
  CreateJobModel createJobModel = CreateJobModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Api Text"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: name,
              decoration: const InputDecoration(hintText: 'Enter Email'),
            ),
            TextFormField(
              controller: job,
              decoration: const InputDecoration(hintText: 'Enter Password'),
            ),
            ElevatedButton(
              onPressed: () {
                ApiServices6()
                    .createJob(name.text.toString(), job.text.toString())
                    .then((value) {
                      setState(() {
                        createJobModel = value!;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeView6(
                            name: createJobModel.name.toString(),
                            job: createJobModel.job.toString(),
                            id: createJobModel.id.toString(),
                            createAt: createJobModel.createdAt.toString(),
                          )),
                        );
                      });
                    });
              },
              child: Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
