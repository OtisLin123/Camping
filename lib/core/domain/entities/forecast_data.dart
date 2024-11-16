import 'package:camping/core/data/model/forecast_data_1h.dart';
import 'package:camping/core/data/model/forecast_data_day.dart';
import 'package:camping/core/data/model/forecast_meta_data.dart';
import 'package:camping/core/data/model/forecast_units.dart';

class ForecastData {
  ForecastMetadata? metaData;
  ForecastUnits? units;
  ForecastData1h? data1h;
  ForecastDataDay? dataDay;

  ForecastData({this.metaData, this.units, this.data1h, this.dataDay});
}
