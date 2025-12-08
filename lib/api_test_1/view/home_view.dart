import 'package:api/api_test_1/view/car_details_view.dart';
import 'package:api/api_test_1/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView1 extends StatelessWidget {
  const HomeView1({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CarController());

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.red,
        title: const Text("Cars List"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.errorMessage.value),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    controller.getApiData();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (controller.carsList.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          itemCount: controller.carsList.length,
          itemBuilder: (context, index) {
            final car = controller.carsList[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 15),
              child: InkWell(
                onTap: () {
                  Get.to(() => CarDetailsPage(car: car));
                },
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              car.modelName ?? 'Unknown Model',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Year: ${car.year ?? 'N/A'}',
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              'Price: ${car.price ?? 'N/A'}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.green,
                              ),
                            ),
                            if (car.manufacturer != null)
                              Text(
                                'Made by: ${car.manufacturer!.name ?? 'N/A'}',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[700],
                                ),
                              ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, color: Colors.deepOrange),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}