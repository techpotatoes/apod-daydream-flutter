import 'dart:async';
import 'dart:convert';

import 'package:apod_daydream_flutter/model/apod.dart';
import 'package:apod_daydream_flutter/repo/apod_cache_manager.dart';

abstract class ApodRepository {
  Future<Apod> getApod();
}

class RestfulApodRepository implements ApodRepository {
  static const String API_KEY = "BtSbq8W1IPztOxALpIuYzh8IcCqbkAiXMpAeUGMZ";
  static const String API = "https://api.nasa.gov/planetary/apod?api_key=$API_KEY";
  
  @override
  Future<Apod> getApod() async {
    var file = await ApodCacheManager().getSingleFile(API);

    if (file != null && await file.exists()) {
      var res = await file.readAsString();
      return Apod.fromJson(json.decode(res));
    } 
    throw Exception('Failed to load APOD');
    }    
  }