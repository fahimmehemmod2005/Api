import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/model.dart';
import '../service/api_services.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  var loginModel = LoginModel().obs;
  var isReady = false.obs;

  Future<void> login() async {
    isReady.value = true;

    await ApiServices5()
        .loginWithModel(email.text.toString(), password.text.toString())
        .then((value) {
      loginModel.value = value!;
      isReady.value = false;
    }).onError((error, stackTrace) {
      isReady.value = false;
      print(error);
    });
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}