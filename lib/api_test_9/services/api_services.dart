import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class ApiServices9 {
  Future<dynamic> uploadImage (Uint8List bytes, String filename)async{
    var request = http.MultipartRequest('POST',Uri.parse('https://api.escuelajs.co/api/v1/files/upload'));
    var multipartFile = http.MultipartFile(
      'file',
      http.ByteStream.fromBytes(bytes),
      bytes.length,
      filename: filename,
    );
    request.files.add(multipartFile);
    final response = await request.send();
    if(response.statusCode == 200 || response.statusCode == 201){
      var data = await response.stream.bytesToString();
      return jsonDecode(data);
    }else{
      return null;
    }
  }
}