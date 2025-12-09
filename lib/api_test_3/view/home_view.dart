import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';

class HomeView3 extends StatelessWidget {
  const HomeView3({super.key});

  @override
  Widget build(BuildContext context) {
    final PostController controller = Get.put(PostController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Testing'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(
            () => controller.isReady.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: controller.postModel.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: Text(controller.postModel[index].id.toString()),
                title: Text(controller.postModel[index].title.toString()),
                subtitle: Text(controller.postModel[index].body.toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}