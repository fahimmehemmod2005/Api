import 'package:get/get.dart';

import '../model/multi_data_api.dart';
import '../services/api_services.dart';

class MultiDataController extends GetxController {
  var multiData = MultiData().obs;
  var isReady = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMultiData();
    print("Multidata: $multiData");
  }

  void getMultiData() {
    isReady.value = true;
    ApiServices4().getMultiDataWithModel().then((value) {
      multiData.value = value ?? MultiData();
      isReady.value = false;
    }).onError((error, stackTrace) {
      print(error);
      isReady.value = false;
    });
  }
}