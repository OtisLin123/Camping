import 'dart:convert';

import 'package:camping/core/repositories/repositories.dart';
import 'package:flutter/services.dart';

class MockRepository implements Repositories {
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
    await Future.delayed(const Duration(seconds: 3));
    return jsonDecode(
      await rootBundle.loadString('assets/test/forecast.json'),
    );
  }
}
