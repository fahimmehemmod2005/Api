import 'dart:convert';
import 'package:api/api_test_1/model/data_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CarController extends GetxController {
  var carsList = <Data>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getApiData();
  }

  Future<void> getApiData() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final url =
          'https://rihanna-preacquisitive-eleanore.ngrok-free.dev/api/cars/';
      final response = await http.get(Uri.parse(url));

      if(response.statusCode == 200 || response.statusCode == 201){
        print('Success');
      }

      print("Response code: ${response.statusCode}");
      print("Response code: ${response.body}");

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        List<Data> loadedCars = [];
        for (var item in jsonData) {
          loadedCars.add(Data.fromJson(item));
        }

        carsList.value = loadedCars;
        isLoading.value = false;
      } else {
        errorMessage.value = 'Failed to load data: ${response.statusCode}';
        isLoading.value = false;
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
      isLoading.value = false;
    }
  }
}
