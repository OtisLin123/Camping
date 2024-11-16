abstract class Repositories {
  Future<dynamic> getCapmingSite();

  /// latitude 緯度
  /// longitude 經度
  /// aboveSeaLevel 海拔
  Future<dynamic> getForecast({
    String? latitude,
    String? longitude,
    String? aboveSeaLevel,
  });
}
