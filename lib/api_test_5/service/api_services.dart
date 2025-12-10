import 'dart:convert';

import 'package:api/api_test_5/model/model.dart';
import 'package:http/http.dart' as http;

class ApiServices5 {

  Future<LoginModel?> loginWithModel(String email, String password) async {

    try {
      var response = await http.post(Uri.parse('https://reqres.in/api/login'),
        headers: {'x-api-key': 'reqres_c52467f8e9e544429765e171feefc8cd'},
        body: {
        "email": email, "password": password
      },);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Success');
      }
      print("Response code: ${response.statusCode}");
      print("Response code: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginModel model = LoginModel.fromJson(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
