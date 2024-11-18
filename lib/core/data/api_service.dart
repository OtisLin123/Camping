abstract class ApiService {
  Future<dynamic> fetchData({required String path, dynamic data});

  Future<dynamic> posthData({required String path, dynamic data});
}
