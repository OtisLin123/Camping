import 'package:camping/core/domain/entities/forecast_data.dart';
import 'package:camping/feature/campsite/domain/entities/day_weather_data.dart';

class GetDayWeather {
  List<DayWeatherData?>? get7DayWeathers(ForecastData? forecastData) {
    List<DayWeatherData?> result = [];
    for (int i = 0; i < 7; i++) {
      result.add(
        DayWeatherData(
          dateTime: DateTime.parse(forecastData?.dataDay?.time?[i] ?? ''),
          temperatureMax: forecastData?.dataDay?.temperatureMax?[i],
          temperatureMin: forecastData?.dataDay?.temperatureMin?[i],
          precipitationProbability:
              forecastData?.dataDay?.precipitationProbability?[i],
        ),
      );
    }
    return result;
  }
}
