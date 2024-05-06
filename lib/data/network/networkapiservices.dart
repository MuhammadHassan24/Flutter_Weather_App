import 'dart:convert';
import 'dart:io';

import 'package:weatherapp/data/app_exception.dart';
import 'package:weatherapp/data/network/baseapiservices.dart';
import 'package:http/http.dart' as http;

class NetWorkApiServices extends BaseApiServices {
  @override
  Future getApiResponse(String url) async {
    dynamic responnseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responnseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("Noe Internat Connection");
    }
    return responnseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responnseJson = jsonDecode(response.body);
        return responnseJson;
      default:
        throw FetchDataException(
            "Error accured while communication with server" +
                "status code " +
                response.statusCode.toString());
    }
  }
}
