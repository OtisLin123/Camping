class DayWeatherData {
  final DateTime? dateTime;
  final num? temperatureMin;
  final num? temperatureMax;
  final num? precipitationProbability;
  const DayWeatherData({
    this.dateTime,
    this.temperatureMax,
    this.temperatureMin,
    this.precipitationProbability,
  });
}
