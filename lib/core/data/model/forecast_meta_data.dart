class ForecastMetadata {
  String? modelrunUpdatetimeUtc;
  String? name;
  num? height;
  String? timezoneAbbrevation;
  num? latitude;
  String? modelrunUtc;
  num? longitude;
  num? utcTimeoffset;
  num? generationTimeMs;

  ForecastMetadata(
      {this.modelrunUpdatetimeUtc,
      this.name,
      this.height,
      this.timezoneAbbrevation,
      this.latitude,
      this.modelrunUtc,
      this.longitude,
      this.utcTimeoffset,
      this.generationTimeMs});

  ForecastMetadata.fromJson(Map<String, dynamic> json) {
    modelrunUpdatetimeUtc = json['modelrun_updatetime_utc'];
    name = json['name'];
    height = json['height'];
    timezoneAbbrevation = json['timezone_abbrevation'];
    latitude = json['latitude'];
    modelrunUtc = json['modelrun_utc'];
    longitude = json['longitude'];
    utcTimeoffset = json['utc_timeoffset'];
    generationTimeMs = json['generation_time_ms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['modelrun_updatetime_utc'] = modelrunUpdatetimeUtc;
    data['name'] = name;
    data['height'] = height;
    data['timezone_abbrevation'] = timezoneAbbrevation;
    data['latitude'] = latitude;
    data['modelrun_utc'] = modelrunUtc;
    data['longitude'] = longitude;
    data['utc_timeoffset'] = utcTimeoffset;
    data['generation_time_ms'] = generationTimeMs;
    return data;
  }
}
