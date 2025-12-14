// "access_token": eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTc2NTY0Mzg3NCwiZXhwIjoxNzY3MzcxODc0fQ.MlKP-ktu2IhQ3q0NJ6AMjW5SuvtgEhaiICsDCX-HlyQ
// "refresh_token": eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTc2NTY0Mzg3NCwiZXhwIjoxNzY1Njc5ODc0fQ.f0SFqgPY-T7pW-JL9cd2VnpEMWi6lI-uoC-uxtriuFg

import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices8 {
  Future<dynamic> getUserDetails() async {

    String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTc2NTY0Mzg3NCwiZXhwIjoxNzY3MzcxODc0fQ.MlKP-ktu2IhQ3q0NJ6AMjW5SuvtgEhaiICsDCX-HlyQ';

    var response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/auth/profile'),

        headers: {
          'Authorization': 'Bearer $token'
        });

    if(response.statusCode == 200 || response.statusCode == 201){
      return jsonDecode(response.body);
    }else{
      print('Status Code: ${response.statusCode}');
      return null;
    }
  }
}
