class ForecastUnits {
  String? cloudcover;
  String? windspeed;
  String? temperature;
  String? sunshinetime;
  String? predictability;
  String? precipitationProbability;
  String? skybrightness;
  String? precipitation;
  String? visibility;
  String? time;
  String? relativehumidity;
  String? pressure;
  String? winddirection;
  String? probability;
  String? moonlight;

  ForecastUnits({
    this.cloudcover,
    this.windspeed,
    this.temperature,
    this.sunshinetime,
    this.predictability,
    this.precipitationProbability,
    this.skybrightness,
    this.precipitation,
    this.visibility,
    this.time,
    this.relativehumidity,
    this.pressure,
    this.winddirection,
    this.probability,
    this.moonlight,
  });

  ForecastUnits.fromJson(Map<String, dynamic>? json) {
    cloudcover = json?['cloudcover'];
    windspeed = json?['windspeed'];
    temperature = json?['temperature'];
    sunshinetime = json?['sunshinetime'];
    predictability = json?['predictability'];
    precipitationProbability = json?['precipitation_probability'];
    skybrightness = json?['skybrightness'];
    precipitation = json?['precipitation'];
    visibility = json?['visibility'];
    time = json?['time'];
    relativehumidity = json?['relativehumidity'];
    pressure = json?['pressure'];
    winddirection = json?['winddirection'];
    probability = json?['probability'];
    moonlight = json?['moonlight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cloudcover'] = cloudcover;
    data['windspeed'] = windspeed;
    data['temperature'] = temperature;
    data['sunshinetime'] = sunshinetime;
    data['predictability'] = predictability;
    data['precipitation_probability'] = precipitationProbability;
    data['skybrightness'] = skybrightness;
    data['precipitation'] = precipitation;
    data['visibility'] = visibility;
    data['time'] = time;
    data['relativehumidity'] = relativehumidity;
    data['pressure'] = pressure;
    data['winddirection'] = winddirection;
    data['probability'] = probability;
    data['moonlight'] = moonlight;
    return data;
  }
}
