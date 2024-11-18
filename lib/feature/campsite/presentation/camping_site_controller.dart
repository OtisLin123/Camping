import 'package:camping/core/data/model/camping_site.dart';
import 'package:camping/core/domain/entities/forecast_data.dart';
import 'package:camping/core/domain/usecase/forecast_data_use_case.dart';
import 'package:camping/feature/campsite/domain/entities/camping_site_page_data.dart';
import 'package:camping/feature/campsite/domain/entities/day_weather_data.dart';
import 'package:camping/feature/campsite/domain/usecase/convert_camping_site_page_data_use_case.dart';
import 'package:camping/feature/campsite/domain/usecase/get_day_weather.dart';
import 'package:camping/feature/open_map/open_map.dart';
import 'package:rxdart/subjects.dart';
import 'package:url_launcher/url_launcher.dart';

class CampingSiteController {
  BehaviorSubject<CampingSitePageData?> campingSitePageData =
      BehaviorSubject<CampingSitePageData?>.seeded(null);

  BehaviorSubject<List<DayWeatherData?>?> dayWeahters =
      BehaviorSubject<List<DayWeatherData?>?>.seeded(null);

  CampingSite? sourceData;
  ForecastDataUseCase? forecastDataUseCase;

  CampingSiteController({
    this.sourceData,
    this.forecastDataUseCase,
  });

  void init() async {
    campingSitePageData.add(
      ConvertCampingSitePageDataUseCase().convertToPageData(
        data: sourceData,
      ),
    );
    forecast();
  }

  void launchWebSite() {
    if (sourceData?.website == null) return;
    launchUrl(
      Uri.parse(sourceData!.website!),
      mode: LaunchMode.externalApplication,
    );
  }

  void launchMap() {
    if (sourceData?.latitudeAndLongitude?.isEmpty ?? true) {
      openMapWith(name: sourceData?.name);
      return;
    }
    List<String?>? latitudeAndLongitude =
        sourceData?.latitudeAndLongitude?.split(',');
    String? latitude = latitudeAndLongitude?.first ?? '';
    String? longitude = latitudeAndLongitude?.last ?? '';
    openMap(latitude: latitude.trim(), longitude: longitude.trim());
  }

  void forecast() async {
    List<String?>? latitudeAndLongitude =
        sourceData?.latitudeAndLongitude?.split(',');
    String? latitude = latitudeAndLongitude?.first ?? '';
    String? longitude = latitudeAndLongitude?.last ?? '';
    if (latitude.isEmpty || longitude.isEmpty) {
      dayWeahters.add([]);
      return;
    }
    ForecastData? forecast = await forecastDataUseCase?.getForecast(
      latitude: latitude.trim(),
      longitude: longitude.trim(),
    );
    dayWeahters.add(GetDayWeather().get7DayWeathers(forecast));
  }
}
