class ForecastDataDay {
  List<String>? time;
  List<int>? temperatureInstant;
  List<double>? precipitation;
  List<int>? predictability;
  List<double>? temperatureMax;
  List<int>? sealevelpressureMean;
  List<double>? windspeedMean;
  List<int>? precipitationHours;
  List<int>? sealevelpressureMin;
  List<int>? pictocode;
  List<int>? snowfraction;
  List<double>? humiditygreater90Hours;
  List<double>? convectivePrecipitation;
  List<int>? relativehumidityMax;
  List<double>? temperatureMin;
  List<int>? winddirection;
  List<double>? felttemperatureMax;
  List<int>? indexto1hvaluesEnd;
  List<int>? relativehumidityMin;
  List<double>? felttemperatureMean;
  List<double>? windspeedMin;
  List<double>? felttemperatureMin;
  List<int>? precipitationProbability;
  List<int>? uvindex;
  List<int>? indexto1hvaluesStart;
  List<String>? rainspot;
  List<double>? temperatureMean;
  List<int>? sealevelpressureMax;
  List<int>? relativehumidityMean;
  List<int>? predictabilityClass;
  List<double>? windspeedMax;

  ForecastDataDay({
    this.time,
    this.temperatureInstant,
    this.precipitation,
    this.predictability,
    this.temperatureMax,
    this.sealevelpressureMean,
    this.windspeedMean,
    this.precipitationHours,
    this.sealevelpressureMin,
    this.pictocode,
    this.snowfraction,
    this.humiditygreater90Hours,
    this.convectivePrecipitation,
    this.relativehumidityMax,
    this.temperatureMin,
    this.winddirection,
    this.felttemperatureMax,
    this.indexto1hvaluesEnd,
    this.relativehumidityMin,
    this.felttemperatureMean,
    this.windspeedMin,
    this.felttemperatureMin,
    this.precipitationProbability,
    this.uvindex,
    this.indexto1hvaluesStart,
    this.rainspot,
    this.temperatureMean,
    this.sealevelpressureMax,
    this.relativehumidityMean,
    this.predictabilityClass,
    this.windspeedMax,
  });

  ForecastDataDay.fromJson(Map<String, dynamic>? json) {
    time = json?['time'].cast<String>();
    temperatureInstant = json?['temperature_instant'].cast<int>();
    precipitation = json?['precipitation'].cast<double>();
    predictability = json?['predictability'].cast<int>();
    temperatureMax = json?['temperature_max'].cast<double>();
    sealevelpressureMean = json?['sealevelpressure_mean'].cast<int>();
    windspeedMean = json?['windspeed_mean'].cast<double>();
    precipitationHours = json?['precipitation_hours'].cast<int>();
    sealevelpressureMin = json?['sealevelpressure_min'].cast<int>();
    pictocode = json?['pictocode'].cast<int>();
    snowfraction = json?['snowfraction'].cast<int>();
    humiditygreater90Hours = json?['humiditygreater90_hours'].cast<double>();
    convectivePrecipitation = json?['convective_precipitation'].cast<double>();
    relativehumidityMax = json?['relativehumidity_max'].cast<int>();
    temperatureMin = json?['temperature_min'].cast<double>();
    winddirection = json?['winddirection'].cast<int>();
    felttemperatureMax = json?['felttemperature_max'].cast<double>();
    indexto1hvaluesEnd = json?['indexto1hvalues_end'].cast<int>();
    relativehumidityMin = json?['relativehumidity_min'].cast<int>();
    felttemperatureMean = json?['felttemperature_mean'].cast<double>();
    windspeedMin = json?['windspeed_min'].cast<double>();
    felttemperatureMin = json?['felttemperature_min'].cast<double>();
    precipitationProbability = json?['precipitation_probability'].cast<int>();
    uvindex = json?['uvindex'].cast<int>();
    indexto1hvaluesStart = json?['indexto1hvalues_start'].cast<int>();
    rainspot = json?['rainspot'].cast<String>();
    temperatureMean = json?['temperature_mean'].cast<double>();
    sealevelpressureMax = json?['sealevelpressure_max'].cast<int>();
    relativehumidityMean = json?['relativehumidity_mean'].cast<int>();
    predictabilityClass = json?['predictability_class'].cast<int>();
    windspeedMax = json?['windspeed_max'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_instant'] = temperatureInstant;
    data['precipitation'] = precipitation;
    data['predictability'] = predictability;
    data['temperature_max'] = temperatureMax;
    data['sealevelpressure_mean'] = sealevelpressureMean;
    data['windspeed_mean'] = windspeedMean;
    data['precipitation_hours'] = precipitationHours;
    data['sealevelpressure_min'] = sealevelpressureMin;
    data['pictocode'] = pictocode;
    data['snowfraction'] = snowfraction;
    data['humiditygreater90_hours'] = humiditygreater90Hours;
    data['convective_precipitation'] = convectivePrecipitation;
    data['relativehumidity_max'] = relativehumidityMax;
    data['temperature_min'] = temperatureMin;
    data['winddirection'] = winddirection;
    data['felttemperature_max'] = felttemperatureMax;
    data['indexto1hvalues_end'] = indexto1hvaluesEnd;
    data['relativehumidity_min'] = relativehumidityMin;
    data['felttemperature_mean'] = felttemperatureMean;
    data['windspeed_min'] = windspeedMin;
    data['felttemperature_min'] = felttemperatureMin;
    data['precipitation_probability'] = precipitationProbability;
    data['uvindex'] = uvindex;
    data['indexto1hvalues_start'] = indexto1hvaluesStart;
    data['rainspot'] = rainspot;
    data['temperature_mean'] = temperatureMean;
    data['sealevelpressure_max'] = sealevelpressureMax;
    data['relativehumidity_mean'] = relativehumidityMean;
    data['predictability_class'] = predictabilityClass;
    data['windspeed_max'] = windspeedMax;
    return data;
  }
}
