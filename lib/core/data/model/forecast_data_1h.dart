class ForecastData1h {
  List<String>? time;
  List<int>? relativehumidity;
  List<num>? nightskybrightnessActual;
  List<double>? precipitation;
  List<int>? sunshinetime;
  List<double>? felttemperature;
  List<num>? nightskybrightnessClearsky;
  List<int>? pictocode;
  List<int>? snowfraction;
  List<num>? moonlightActual;
  List<int>? highclouds;
  List<double>? convectivePrecipitation;
  List<int>? isdaylight;
  List<num>? fogProbability;
  List<num>? moonlightClearsky;
  List<double>? zenithangle;
  List<int>? winddirection;
  List<double>? windspeed;
  List<num>? totalcloudcover;
  List<int>? visibility;
  List<int>? precipitationProbability;
  List<int>? uvindex;
  List<int>? lowclouds;
  List<int>? temperature;
  List<String>? rainspot;
  List<double>? sealevelpressure;
  List<int>? midclouds;

  ForecastData1h({
    this.time,
    this.relativehumidity,
    this.nightskybrightnessActual,
    this.precipitation,
    this.sunshinetime,
    this.felttemperature,
    this.nightskybrightnessClearsky,
    this.pictocode,
    this.snowfraction,
    this.moonlightActual,
    this.highclouds,
    this.convectivePrecipitation,
    this.isdaylight,
    this.fogProbability,
    this.moonlightClearsky,
    this.zenithangle,
    this.winddirection,
    this.windspeed,
    this.totalcloudcover,
    this.visibility,
    this.precipitationProbability,
    this.uvindex,
    this.lowclouds,
    this.temperature,
    this.rainspot,
    this.sealevelpressure,
    this.midclouds,
  });

  ForecastData1h.fromJson(Map<String, dynamic>? json) {
    time = json?['time'].cast<String>();
    relativehumidity = json?['relativehumidity'].cast<int>();
    nightskybrightnessActual = json?['nightskybrightness_actual'].cast<num>();
    precipitation = json?['precipitation'].cast<double>();
    sunshinetime = json?['sunshinetime'].cast<int>();
    felttemperature = json?['felttemperature'].cast<double>();
    nightskybrightnessClearsky =
        json?['nightskybrightness_clearsky'].cast<num>();
    pictocode = json?['pictocode'].cast<int>();
    snowfraction = json?['snowfraction'].cast<int>();
    moonlightActual = json?['moonlight_actual'].cast<num>();
    highclouds = json?['highclouds'].cast<int>();
    convectivePrecipitation = json?['convective_precipitation'].cast<double>();
    isdaylight = json?['isdaylight'].cast<int>();
    fogProbability = json?['fog_probability'].cast<num>();
    moonlightClearsky = json?['moonlight_clearsky'].cast<num>();
    zenithangle = json?['zenithangle'].cast<double>();
    winddirection = json?['winddirection'].cast<int>();
    windspeed = json?['windspeed'].cast<double>();
    totalcloudcover = json?['totalcloudcover'].cast<num>();
    visibility = json?['visibility'].cast<int>();
    precipitationProbability = json?['precipitation_probability'].cast<int>();
    uvindex = json?['uvindex'].cast<int>();
    lowclouds = json?['lowclouds'].cast<int>();
    temperature = json?['temperature'].cast<int>();
    rainspot = json?['rainspot'].cast<String>();
    sealevelpressure = json?['sealevelpressure'].cast<double>();
    midclouds = json?['midclouds'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['relativehumidity'] = relativehumidity;
    data['nightskybrightness_actual'] = nightskybrightnessActual;
    data['precipitation'] = precipitation;
    data['sunshinetime'] = sunshinetime;
    data['felttemperature'] = felttemperature;
    data['nightskybrightness_clearsky'] = nightskybrightnessClearsky;
    data['pictocode'] = pictocode;
    data['snowfraction'] = snowfraction;
    data['moonlight_actual'] = moonlightActual;
    data['highclouds'] = highclouds;
    data['convective_precipitation'] = convectivePrecipitation;
    data['isdaylight'] = isdaylight;
    data['fog_probability'] = fogProbability;
    data['moonlight_clearsky'] = moonlightClearsky;
    data['zenithangle'] = zenithangle;
    data['winddirection'] = winddirection;
    data['windspeed'] = windspeed;
    data['totalcloudcover'] = totalcloudcover;
    data['visibility'] = visibility;
    data['precipitation_probability'] = precipitationProbability;
    data['uvindex'] = uvindex;
    data['lowclouds'] = lowclouds;
    data['temperature'] = temperature;
    data['rainspot'] = rainspot;
    data['sealevelpressure'] = sealevelpressure;
    data['midclouds'] = midclouds;
    return data;
  }
}
