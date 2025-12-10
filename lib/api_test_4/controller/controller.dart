import 'package:get/get.dart';
import '../model/multi_data_api.dart';
import '../services/api_services.dart';

class MultiDataController extends GetxController {
  Rx<MultiData> multiData = MultiData().obs;
  RxBool isReady = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMultiData();
  }

  void getMultiData() {
    isReady.value = true;
    ApiServices4().getMultiDataWithModel().then((value) {
      multiData.value = value!;
      isReady.value = false;
    }).onError((error, stackTrace) {
      print(error);
      isReady.value = false;
    });
  }
}