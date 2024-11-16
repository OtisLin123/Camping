import 'package:camping/core/domain/entities/forecast_data.dart';
import 'package:camping/feature/campsite/domain/entities/day_weather_data.dart';

class GetDayWeather {
  List<DayWeatherData?>? get7DayWeathers(ForecastData? forecastData) {
    List<DayWeatherData?> result = [];
    List<int> hourIndex = [0, 1, 2, 3, 4, 22, 23];
    for (int i = 0; i < 7; i++) {
      result.add(
        DayWeatherData(
          dateTime: forecastData?.dataDay?.time?[i] == null
              ? null
              : DateTime.parse(forecastData?.dataDay?.time?[i] ?? ''),
          temperatureMax: forecastData?.dataDay?.temperatureMax?[i],
          temperatureMin: forecastData?.dataDay?.temperatureMin?[i],
          precipitationProbability:
              forecastData?.dataDay?.precipitationProbability?[i],
          idayPictocode: forecastData?.dataDay?.pictocode?[i],
          nightskybrightnessActual: List.generate(
            hourIndex.length,
            (index) => forecastData
                ?.data1h?.nightskybrightnessActual?[i * 24 + hourIndex[index]],
          ),
          nightskybrightnessClearsky: List.generate(
            hourIndex.length,
            (index) => forecastData?.data1h
                ?.nightskybrightnessClearsky?[i * 24 + hourIndex[index]],
          ),
          moonlightActual: List.generate(
            hourIndex.length,
            (index) => forecastData
                ?.data1h?.moonlightActual?[i * 24 + hourIndex[index]],
          ),
          moonlightClearsky: List.generate(
            hourIndex.length,
            (index) => forecastData
                ?.data1h?.moonlightClearsky?[i * 24 + hourIndex[index]],
          ),
          totalcloudcover: List.generate(
            hourIndex.length,
            (index) => forecastData
                ?.data1h?.totalcloudcover?[i * 24 + hourIndex[index]],
          ),
          fogProbability: List.generate(
            hourIndex.length,
            (index) => forecastData
                ?.data1h?.fogProbability?[i * 24 + hourIndex[index]],
          ),
        ),
      );
    }
    return result;
  }
}
