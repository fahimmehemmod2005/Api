import 'dart:convert';
import 'package:api/api_test_7/model/model.dart';
import "package:http/http.dart" as http;

class ApiServices7 {
  Future<RegisterModel?> register(String email, String password) async {
    try {
      var url = Uri.parse('https://reqres.in/api/register');
      var response = await http.post(
        url,
        headers: {'x-api-key': 'reqres_c52467f8e9e544429765e171feefc8cd'},
        body: {"email": email, "password": password},
      );
      print('Status code: ${response.statusCode}');
      print('Header: ${response.headers}');
      print('Body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        RegisterModel model = RegisterModel.fromJson(jsonDecode(response.body));
        return model;
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Susscess');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
