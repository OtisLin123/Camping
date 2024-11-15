import 'package:camping/core/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourceDeclarationController {
  void launchGovOpenDataWeb() {
    launchUrl(
      Uri.parse(govOpenDataSourceUrl),
      mode: LaunchMode.externalApplication,
    );
  }

  void launchWeatherWeb() {
    launchUrl(
      Uri.parse(weatherDataSourceUrl),
      mode: LaunchMode.externalApplication,
    );
  }
}
