import 'dart:convert';

import 'package:api/api_test_6/model/model.dart';
import 'package:http/http.dart' as http;

class ApiServices6 {

  Future<CreateJobModel?> createJob(String name, String job) async {
    
    try{
      var url = Uri.parse('https://reqres.in/api/users');
      var response = await http.post(url,
        headers: {'x-api-key': 'reqres_c52467f8e9e544429765e171feefc8cd'},
        body: {
          "name": name,
          "job": job
        }
      );

      if(response.statusCode == 200 || response.statusCode == 201){
        print('Success');
        print('Response Code${response.statusCode}');
        print('Response Body${response.body}');

        if(response.statusCode == 200 || response.statusCode == 201){
          CreateJobModel model = CreateJobModel.fromJson(jsonDecode(response.body));
          return model;
        }
      }
    }catch(e){
      print(e.toString());
    }
    return null;
  }
}