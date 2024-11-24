import 'package:camping/core/repositories/repositories.dart';

class AppController {
  AppController._privateConstructor();

  static final AppController _instance = AppController._privateConstructor();

  factory AppController() {
    return _instance;
  }

  Repositories? repositories;
}
