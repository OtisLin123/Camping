class ForecastUnits {
  String? predictability;
  String? precipitation;
  String? windspeed;
  String? precipitationProbability;
  String? skybrightness;
  String? relativehumidity;
  String? temperature;
  String? time;
  String? moonlight;
  String? pressure;
  String? winddirection;

  ForecastUnits(
      {this.predictability,
      this.precipitation,
      this.windspeed,
      this.precipitationProbability,
      this.skybrightness,
      this.relativehumidity,
      this.temperature,
      this.time,
      this.moonlight,
      this.pressure,
      this.winddirection});

  ForecastUnits.fromJson(Map<String, dynamic> json) {
    predictability = json['predictability'];
    precipitation = json['precipitation'];
    windspeed = json['windspeed'];
    precipitationProbability = json['precipitation_probability'];
    skybrightness = json['skybrightness'];
    relativehumidity = json['relativehumidity'];
    temperature = json['temperature'];
    time = json['time'];
    moonlight = json['moonlight'];
    pressure = json['pressure'];
    winddirection = json['winddirection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['predictability'] = predictability;
    data['precipitation'] = precipitation;
    data['windspeed'] = windspeed;
    data['precipitation_probability'] = precipitationProbability;
    data['skybrightness'] = skybrightness;
    data['relativehumidity'] = relativehumidity;
    data['temperature'] = temperature;
    data['time'] = time;
    data['moonlight'] = moonlight;
    data['pressure'] = pressure;
    data['winddirection'] = winddirection;
    return data;
  }
}
