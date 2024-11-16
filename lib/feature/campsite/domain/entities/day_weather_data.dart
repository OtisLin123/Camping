import 'dart:math';

import 'package:camping/extension/string_extension.dart';

class DayWeatherData {
  final DateTime? dateTime;
  final num? temperatureMin;
  final num? temperatureMax;
  final num? precipitationProbability;
  final int? idayPictocode;

  final List<num?>? nightskybrightnessActual;
  final List<num?>? nightskybrightnessClearsky;
  final List<num?>? moonlightActual;
  final List<num?>? moonlightClearsky;
  final List<num?>? totalcloudcover;
  final List<num?>? fogProbability;

  const DayWeatherData({
    this.dateTime,
    this.temperatureMax,
    this.temperatureMin,
    this.precipitationProbability,
    this.idayPictocode,
    this.nightskybrightnessActual,
    this.nightskybrightnessClearsky,
    this.moonlightActual,
    this.moonlightClearsky,
    this.totalcloudcover,
    this.fogProbability,
  });

  String? getPictogramDesc() =>
      idayPictocode == null ? null : 'iday_pictograms_$idayPictocode'.locale();

  String? getPictogramImagePath() => idayPictocode == null
      ? null
      : 'assets/meteo_blue/pictograms/${idayPictocode.toString().padLeft(2, '0')}_iday.png';

  num? getNightSkySource({
    num? nightskybrightnessActual,
    num? nightskybrightnessClearsky,
  }) {
    if (nightskybrightnessActual == null ||
        nightskybrightnessClearsky == null) {
      return null;
    }
    num delta = nightskybrightnessActual - nightskybrightnessClearsky;
    if (delta <= 0) {
      return 100;
    } else if (0 < delta && delta < 2) {
      return ((2 - delta) / 2) * 100;
    } else {
      return 0;
    }
  }

  num? getMoonlightImpact({
    num? moonlightActual,
    num? moonlightClearsky,
  }) {
    if (moonlightActual == null || moonlightClearsky == null) {
      return null;
    }
    num source = max(0, 100 - (moonlightActual - moonlightClearsky));
    return min(source, 100);
  }

  num? getCloudImpact({
    num? totalcloudcover,
    num? fogProbability,
  }) {
    if (totalcloudcover == null || fogProbability == null) {
      return null;
    }
    num source = max(0, 100 - (totalcloudcover + fogProbability));
    return min(source, 100);
  }

  num getStarRatingAvarage() {
    List<StarRating?>? result = getStarRating();
    if (result == null) return 0;

    if (result.isEmpty) return 0;
    num sum = 0;
    for (var e in result) {
      sum = (e?.source ?? 0) + sum;
    }
    return (sum / result.length).floor();
  }

  List<StarRating?>? getStarRating() {
    List<StarRating?> result = [];
    List<int> index = [0, 1, 2, 3, 4, 22, 23];
    for (int i = 0; i < index.length; i++) {
      num? nightSkySource = getNightSkySource(
        nightskybrightnessActual: nightskybrightnessActual?[i],
        nightskybrightnessClearsky: nightskybrightnessClearsky?[i],
      );
      num? moonlightImpact = getMoonlightImpact(
        moonlightActual: moonlightActual?[i],
        moonlightClearsky: moonlightClearsky?[i],
      );
      num? cloudImpact = getCloudImpact(
        totalcloudcover: totalcloudcover?[i],
        fogProbability: fogProbability?[i],
      );
      if (nightSkySource == null ||
          moonlightImpact == null ||
          cloudImpact == null) {
        result.add(null);
      } else {
        num? starRatingSource =
            ((nightSkySource + moonlightImpact + cloudImpact) / 300) * 100;
        starRatingSource = starRatingSource.floor();
        result.add(
          StarRating(
            source: starRatingSource,
            time: '${index[i].toString().padLeft(2, '0')}:00',
          ),
        );
      }
    }
    return result;
  }
}

class StarRating {
  String? time;
  num? source;
  StarRating({this.time, this.source});
}
