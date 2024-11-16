import 'package:camping/core/domain/entities/forecast_data.dart';

abstract class ForecastDataUseCase {
  Future<ForecastData?> getForecast({
    String? latitude,
    String? longitude,
    String? aboveSeaLevel,
  });
}
