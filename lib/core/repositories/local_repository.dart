import 'dart:convert';

import 'package:camping/core/repositories/repositories.dart';
import 'package:flutter/services.dart';

class LocalRepository implements Repositories {
  @override
  Future<dynamic> getCapmingSite() async {
    return jsonDecode(
      await rootBundle.loadString('assets/location/taiwanCamping.json'),
    );
  }
}
