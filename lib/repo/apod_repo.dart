import 'dart:async';
import 'dart:convert';

import 'package:apod_daydream_flutter/model/apod.dart';
import 'package:http/http.dart' as http;

abstract class ApodRepository {
  Future<Apod> getApod();
}

class RestfulApodRepository implements ApodRepository {
  static const String API_KEY = "DEMO_KEY";
  static const String API = "https://api.nasa.gov/planetary/apod?api_key=$API_KEY";
  
  @override
  Future<Apod> getApod() async {
    var response = await http.get(API);
    
    if (response.statusCode == 200) {
      print(response.body);
      return Apod.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load APOD');
    }    
  }

}