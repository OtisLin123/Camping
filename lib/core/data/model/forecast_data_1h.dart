class ForecastData1h {
  List<String>? time;
  List<int>? moonlightActual;
  List<int>? snowfraction;
  List<double>? windspeed;
  List<double>? temperature;
  List<int>? precipitationProbability;
  List<int>? convectivePrecipitation;
  List<double>? moonlightClearsky;
  List<String>? rainspot;
  List<double>? zenithangle;
  List<int>? pictocode;
  List<double>? felttemperature;
  List<int>? precipitation;
  List<int>? isdaylight;
  List<int>? uvindex;
  List<int>? relativehumidity;
  List<int>? nightskybrightnessActual;
  List<double>? nightskybrightnessClearsky;
  List<double>? sealevelpressure;
  List<int>? winddirection;

  ForecastData1h(
      {this.time,
      this.moonlightActual,
      this.snowfraction,
      this.windspeed,
      this.temperature,
      this.precipitationProbability,
      this.convectivePrecipitation,
      this.moonlightClearsky,
      this.rainspot,
      this.zenithangle,
      this.pictocode,
      this.felttemperature,
      this.precipitation,
      this.isdaylight,
      this.uvindex,
      this.relativehumidity,
      this.nightskybrightnessActual,
      this.nightskybrightnessClearsky,
      this.sealevelpressure,
      this.winddirection});

  ForecastData1h.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    moonlightActual = json['moonlight_actual'].cast<int>();
    snowfraction = json['snowfraction'].cast<int>();
    windspeed = json['windspeed'].cast<double>();
    temperature = json['temperature'].cast<double>();
    precipitationProbability = json['precipitation_probability'].cast<int>();
    convectivePrecipitation = json['convective_precipitation'].cast<int>();
    moonlightClearsky = json['moonlight_clearsky'].cast<double>();
    rainspot = json['rainspot'].cast<String>();
    zenithangle = json['zenithangle'].cast<double>();
    pictocode = json['pictocode'].cast<int>();
    felttemperature = json['felttemperature'].cast<double>();
    precipitation = json['precipitation'].cast<int>();
    isdaylight = json['isdaylight'].cast<int>();
    uvindex = json['uvindex'].cast<int>();
    relativehumidity = json['relativehumidity'].cast<int>();
    nightskybrightnessActual = json['nightskybrightness_actual'].cast<int>();
    nightskybrightnessClearsky =
        json['nightskybrightness_clearsky'].cast<double>();
    sealevelpressure = json['sealevelpressure'].cast<double>();
    winddirection = json['winddirection'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['moonlight_actual'] = moonlightActual;
    data['snowfraction'] = snowfraction;
    data['windspeed'] = windspeed;
    data['temperature'] = temperature;
    data['precipitation_probability'] = precipitationProbability;
    data['convective_precipitation'] = convectivePrecipitation;
    data['moonlight_clearsky'] = moonlightClearsky;
    data['rainspot'] = rainspot;
    data['zenithangle'] = zenithangle;
    data['pictocode'] = pictocode;
    data['felttemperature'] = felttemperature;
    data['precipitation'] = precipitation;
    data['isdaylight'] = isdaylight;
    data['uvindex'] = uvindex;
    data['relativehumidity'] = relativehumidity;
    data['nightskybrightness_actual'] = nightskybrightnessActual;
    data['nightskybrightness_clearsky'] = nightskybrightnessClearsky;
    data['sealevelpressure'] = sealevelpressure;
    data['winddirection'] = winddirection;
    return data;
  }
}
