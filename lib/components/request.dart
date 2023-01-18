import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

String _basicAuth = 'Basic ' + base64Encode(utf8.encode('abdo:123456'));

Map<String, String> myheaders = {'authorization': _basicAuth};

class Request {
  getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url), headers: myheaders);
      if (response.statusCode == 200) {
        //print(response.body);
        var responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        Get.snackbar("Error", "try again  later");
      }
    } catch (e) {
      Get.snackbar("Error", "try again  later");
    }
  }

  Future<String?> postRequest(String url, Map data) async {
    try {
      var response =
          await http.post(Uri.parse(url), body: data, headers: myheaders);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        Get.snackbar("Error", "try again  later");
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", "try again  later");
      return null;
    }
  }

  postRequestWithFile(String url, Map data, File file) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    var lenght = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multiPartFile = http.MultipartFile("image", stream, lenght,
        filename: basename(file.path));
    request.files.add(multiPartFile);
    request.headers.addAll(myheaders);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);
    if (myRequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      Get.snackbar("Error", "try again  later");
    }
  }
}
