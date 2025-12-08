import 'package:get/get.dart';

import '../model/single_post_with_model.dart';
import '../services/api_services.dart';

class SinglePostController extends GetxController {
  var isReady = false.obs;
  var singlePostWithModel = SinglePostWithModel().obs;

  @override
  void onInit() {
    super.onInit();
    getSinglePost();
  }

  void getSinglePost() {
    isReady.value = true;
    ApiServices().getSinglePostWithModel().then((value) {
      singlePostWithModel.value = value!;
      isReady.value = false;
    });
  }
}