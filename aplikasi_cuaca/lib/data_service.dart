import 'dart:convert';

import 'package:aplikasi_cuaca/wheather.dart';
import 'package:http/http.dart' as http;

class DataService{

  Future<Weather> fecthData(String cityName) async{
    try {
      //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
      final queryParameters = {
      'q' : cityName,
      'appid' : '0a8bfa8a88934f01491dc189dc8d4294',
      'units' : 'imperial'
  };
    final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParameters);  
    final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else{
        throw Exception('Failed to load weather');
      }

    } catch (e) {
      rethrow;
    }  
  }
}