import 'package:camping/core/data/model/camping_site.dart';
import 'package:camping/feature/camping_list/domain/entities/camping_card_data.dart';

class ConvertCampingCardDatasUseCase {
  List<CampingCardData?>? convertToCardDatas({List<CampingSite?>? datas}) {
    return List.generate(
      datas?.length ?? 0,
      (index) => convertToCardData(
        data: datas?[index],
      ),
    );
  }

  CampingCardData? convertToCardData({CampingSite? data}) {
    return CampingCardData(
      uuid: data?.uuid,
      name: data?.name,
      address: data?.address,
      phoneNumber: data?.telephone,
      website: data?.website,
      compliantWithRelevantRegulations: data?.compliantWithRelevantRegulations,
      violationOfRelevantRegulations: data?.violationOfRelevantRegulations,
      latitudeAndLongitude: data?.latitudeAndLongitude,
    );
  }
}
