import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';
import 'home_view.dart';

class LoginView1 extends StatelessWidget {
  const LoginView1({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Login Api Text"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.email, /// eve.holt@reqres.in
              decoration: const InputDecoration(hintText: 'Enter Email'),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: controller.password, /// cityslicka
              decoration: const InputDecoration(hintText: 'Enter Password'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Obx(
                    () => ElevatedButton(
                  onPressed: () async {
                    await controller.login();

                    if (controller.loginModel.value.token != null) {
                      Get.to(() => HomeView5(
                          token: controller.loginModel.value.token.toString()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    elevation: 5.0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: controller.isReady.value
                      ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                      : const Text("Login"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}