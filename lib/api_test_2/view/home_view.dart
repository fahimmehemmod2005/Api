import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller/controller.dart';

class HomeView2 extends StatelessWidget {
  const HomeView2({super.key});

  @override
  Widget build(BuildContext context) {
    final SinglePostController controller = Get.put(SinglePostController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Single Data'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(() {
        if (controller.isReady.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User Id: ${controller.singlePostWithModel.value.userId.toString()}",
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
              Text(
                "Id: ${controller.singlePostWithModel.value.id.toString()}",
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
              Text(
                "Title: ${controller.singlePostWithModel.value.title.toString()}",
                style: const TextStyle(fontSize: 18, color: Colors.green),
              ),
              Text(
                "body: ${controller.singlePostWithModel.value.body.toString()}",
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        );
      }),
    );
  }
}