import 'dart:convert';

import 'package:archline_flutter/models/cls_about.dart';
import 'package:archline_flutter/models/cls_contact.dart';
import 'package:archline_flutter/models/cls_portfolio.dart';
import 'package:archline_flutter/models/cls_service.dart';
import 'package:archline_flutter/models/cls_user.dart';
import 'package:archline_flutter/utility/constants.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  static var client = http.Client();

  Future<List<ClsService>> fetchServicesList() async {
    var servicesList = <ClsService>[];
    try {
      var response = await client.get(
          Uri.parse("${Constants.apiUrl}/getservices"));
      if(response.statusCode == 200){
        var jsonString = response.body;
        var svcs = json.decode(jsonString) as List;
        servicesList = List<ClsService>.from(svcs.map((e) => ClsService
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

  Future<ClsAbout> fetchAboutInfo() async {
    ClsAbout aboutInfo = ClsAbout();

    try {
      var response = await client.get(
          Uri.parse("${Constants.apiUrl}/getaboutdetail"));
      if(response.statusCode == 200){
        var jsonString = response.body;
        var aboutsJson = json.decode(jsonString) as List;
        var aboutList = List<ClsAbout>.from(aboutsJson.map((e) => ClsAbout.fromJson(e)));

        if(aboutList.isNotEmpty){
          aboutInfo = aboutList[0];
        }
      }

      response = await client.get(
          Uri.parse("${Constants.apiUrl}/getallusers"));
      if(response.statusCode == 200){
        var jsonString = response.body;
        var usersJson = json.decode(jsonString) as List;
        var usersList = List<ClsUser>.from(usersJson.map((e) => ClsUser.fromJson
          (e)));

        aboutInfo.usersList = usersList;
      }
    }
    catch(ex) {
      print("Exception DESC => ${ex.toString()}");
    }

    return aboutInfo;
  }

  Future<ClsContact> fetchContactInfo() async {
    ClsContact contactInfo = ClsContact();

    try {
      var response = await client.get(
          Uri.parse("${Constants.apiUrl}/getcontactdetail"));
      if(response.statusCode == 200){
        var jsonString = response.body;
        var contactsJson = json.decode(jsonString) as List;
        var contactList = List<ClsContact>.from(contactsJson.map((e) =>
            ClsContact.fromJson(e)));

        if(contactList.isNotEmpty){
          contactInfo = contactList[0];
        }
      }
    }
    catch(ex) {
      print("Exception DESC => ${ex.toString()}");
    }

    return contactInfo;
  }

  Future<List<ClsPortfolio>> fetchPortfolio() async {
    var portfolioInfo = <ClsPortfolio>[];

    try {
      var response = await client.get(
          Uri.parse("${Constants.apiUrl}/getgallary"));
      if(response.statusCode == 200){
        var jsonString = response.body;
        var portfolioListJson = json.decode(jsonString) as List;
        var portfolioList = List<ClsPortfolio>.from(portfolioListJson.map((e) => ClsPortfolio.fromJson(e)));

        if(portfolioList.isNotEmpty){
          portfolioInfo = portfolioList;
        }
      }
    }
    catch(ex) {
      print("Exception DESC => ${ex.toString()}");
    }

    return portfolioInfo;
  }
}