import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/single_post_with_model.dart';

class ApiServices2 {
  Future<SinglePostWithModel?> getSinglePostWithModel() async {
    try {
      var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        SinglePostWithModel model = SinglePostWithModel.fromJson(
          jsonDecode(response.body),
        );

        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
