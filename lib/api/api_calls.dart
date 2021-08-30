import 'dart:convert';

import 'package:archline_flutter/models/cls_service.dart';
import 'package:archline_flutter/utility/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  static var client = http.Client();

  Future<RxList<ClsService>> fetchServicesList() async {
    var servicesList = <ClsService>[].obs;
    try {
      var response = await client.get(
          Uri.parse("${Constants.apiUrl}/getservices"));
      if(response.statusCode == 200){
        var jsonString = response.body;
        var svcs = json.decode(jsonString) as List;
        servicesList = RxList<ClsService>.from(svcs.map((e) => ClsService
            .fromJson(e)));
      }
    }
    catch(ex) {
      print("Exception DESC => ${ex.toString()}");
    }

    print("${Constants.apiUrl}/getservices => Count of items is : ${servicesList
        .length}");

    return servicesList;
  }
}