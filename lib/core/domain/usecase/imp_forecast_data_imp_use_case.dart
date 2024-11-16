import 'package:camping/core/data/dio_api_service.dart';
import 'package:camping/core/data/model/forecast_data_1h.dart';
import 'package:camping/core/data/model/forecast_data_day.dart';
import 'package:camping/core/data/model/forecast_meta_data.dart';
import 'package:camping/core/data/model/forecast_units.dart';
import 'package:camping/core/domain/entities/forecast_data.dart';
import 'package:camping/core/domain/usecase/forecast_data_use_case.dart';
import 'package:camping/core/repositories/repository.dart';

class ImpForecastDataUseCase extends ForecastDataUseCase {
  @override
  Future<ForecastData?> getForecast({
    String? latitude,
    String? longitude,
    String? aboveSeaLevel,
  }) async {
    dynamic forecast =
        await Repository(apiService: DioApiService()).getForecast(
      latitude: latitude,
      longitude: longitude,
    );
    ForecastMetadata? metaData = ForecastMetadata.fromJson(
      forecast?['metadata'],
    );
    ForecastUnits? units = ForecastUnits.fromJson(
      forecast?['units'],
    );
    ForecastData1h? data1h = ForecastData1h.fromJson(
      forecast?['data_1h'],
    );
    ForecastDataDay? dataDay = ForecastDataDay.fromJson(
      forecast?['data_day'],
    );
    return ForecastData(
      metaData: metaData,
      units: units,
      data1h: data1h,
      dataDay: dataDay,
    );
  }
}
