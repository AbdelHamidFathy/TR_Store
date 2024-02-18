import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  final encoding = Encoding.getByName('utf-8');

  Future<T> getDataRequest<T>({
    required String url,
    required T Function(dynamic response) parseResponse,
  }) async {
    var headers = {
      "Content-Type": "application/json",
    };

    try {
      var response = await http
          .get(
            Uri.parse(url),
            headers: headers,
          )
          .timeout(const Duration(seconds: 30));

      var decodeResponse = await jsonDecode(response.body);
      var parsedResponse = parseResponse(decodeResponse);

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return parsedResponse;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (error) {
      if (error is TimeoutException) {}
      Get.log(error.toString());
      return Future.error(error);
    }
  }
}
