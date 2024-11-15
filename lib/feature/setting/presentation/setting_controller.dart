import 'dart:async';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:rxdart/subjects.dart';

class SettingController {
  BehaviorSubject<String?> versionSubject =
      BehaviorSubject<String?>.seeded(null);
  Set<StreamSubscription?> subs = {};

  Future<void> init() async {
    PackageInfo.fromPlatform().then((info) {
      versionSubject.add(info.version);
    });
  }

  void dispose() {
    for (var element in subs) {
      element?.cancel();
    }
  }
}
