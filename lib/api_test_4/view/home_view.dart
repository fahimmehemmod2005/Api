import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';

class HomeView4 extends StatelessWidget {
  const HomeView4({super.key});

  @override
  Widget build(BuildContext context) {
    final MultiDataController controller = Get.put(MultiDataController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Data Api'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Obx(
            () => controller.isReady.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.multiData.value.page.toString(),
              style: const TextStyle(color: Colors.teal, fontSize: 18),
            ),
            Text(
              controller.multiData.value.total.toString(),
              style: const TextStyle(color: Colors.teal, fontSize: 18),
            ),
            Text(
              controller.multiData.value.totalPages.toString(),
              style: const TextStyle(color: Colors.teal, fontSize: 18),
            ),
            Text(
              controller.multiData.value.support!.text.toString(),
              style: const TextStyle(color: Colors.teal, fontSize: 18),
            ),Text(
              controller.multiData.value.support!.url.toString(),
              style: const TextStyle(color: Colors.teal, fontSize: 18),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.multiData.value.data!.length,
                itemBuilder: (_, i) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Text(controller.multiData.value.data![i].id.toString()),),
                      title: Text(controller.multiData.value.data![i].name.toString()),
                      subtitle: Text(controller.multiData.value.data![i].pantoneValue.toString()),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}