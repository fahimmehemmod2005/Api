import 'package:api/api_test_3/services/api_services.dart';
import 'package:get/get.dart';
import '../model/post_model.dart';

class PostController extends GetxController {
  var isReady = true.obs;
  var postModel = <PostModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getPost();
  }

  void getPost() {
    isReady.value = true;
    ApiServices3().getPostWithModel().then((value) {
      postModel.value = value ?? [];
      isReady.value = false;
    });
  }
}