import 'dart:typed_data';
import 'package:api/api_test_9/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LoginView5 extends StatefulWidget {
  const LoginView5({super.key});

  @override
  State<LoginView5> createState() => _LoginView5State();
}

class _LoginView5State extends State<LoginView5> {
  String uploadedImage = "";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Android, iOS & Web'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Center(
        child: isLoading == true
            ?CircularProgressIndicator()
            : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              uploadedImage == ''?const SizedBox():
                  Container(
                    height: 200,width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(uploadedImage))
                    ),
                  ),
              ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                // Pick an image.
                final XFile? image = await picker.pickImage(
                  source: ImageSource.gallery,
                );

                if (image != null) {
                  setState(() {
                    isLoading = true;
                  });
                  Uint8List bytes = await image.readAsBytes();

                  ApiServices9()
                      .uploadImage(bytes, image.name)
                      .then((value) {
                        print('Response${value.toString()}');
                        setState(() {
                          uploadedImage = value['location'].toString();
                          setState(() {
                            isLoading = false;
                          });
                        });
                      })
                      .onError((error, stackTrace) {
                    setState(() {
                      isLoading = true;
                    });
                        print(error.toString());
                      });
                }
              },
              child: Text('Upload Image', style: TextStyle(color: Colors.white)),
            ),
      ],
          ),

      ),
    );
  }
}
