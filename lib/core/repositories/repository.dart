import 'dart:convert';

import 'package:camping/core/data/api_service.dart';
import 'package:camping/core/repositories/repositories.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class Repository implements Repositories {
  ApiService? apiService;

  Repository({this.apiService});

  @override
  Future<dynamic> getCapmingSite() async {
    return jsonDecode(
      await rootBundle.loadString('assets/location/taiwanCamping.json'),
    );
  }

  @override
  Future<dynamic> getForecast({
    String? latitude,
    String? longitude,
    String? aboveSeaLevel,
  }) async {
    if ((latitude?.isEmpty ?? true) || (longitude?.isEmpty ?? true)) {
      return {};
    }
    dynamic keyData = jsonDecode(
      await rootBundle.loadString('assets/key.json'),
    );
    String? forecastApiKey = keyData['forecastApiKey'];
    if (forecastApiKey?.isEmpty ?? true) {
      return;
    }
    String url =
        'https://my.meteoblue.com/packages/basic-1h_basic-day_clouds-1h_moonlight-1h?apikey=$forecastApiKey&lat=$latitude&lon=$longitude&format=json';
    Response<dynamic>? res = await apiService?.fetchData(
      path: url,
    );
    return res?.data;
  }
}
