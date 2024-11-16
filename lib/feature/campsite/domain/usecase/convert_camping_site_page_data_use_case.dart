import 'package:camping/core/data/model/camping_site.dart';
import 'package:camping/feature/campsite/domain/entities/camping_site_page_data.dart';

class ConvertCampingSitePageDataUseCase {
  CampingSitePageData? convertToPageData({CampingSite? data}) {
    return CampingSitePageData(
      name: data?.name,
      address: data?.address,
      phoneNumber: data?.telephone,
      website: data?.website,
      compliantWithRelevantRegulations: data?.compliantWithRelevantRegulations,
      violationOfRelevantRegulations: data?.violationOfRelevantRegulations,
    );
  }
}
