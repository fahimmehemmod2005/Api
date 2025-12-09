import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/multi_data_api.dart';

class ApiServices4 {
  Future<MultiData?> getMultiDataWithModel() async {
    try {
      var response = await http.get(Uri.parse('https://reqres.in/api/unknown'),headers: {
        'x-api-key':'reqres_c52467f8e9e544429765e171feefc8cd'
      });

      print("Response code: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        MultiData model = MultiData.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }
}
