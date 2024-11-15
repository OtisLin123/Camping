import 'package:camping/core/data/model/camping_site.dart';

abstract class GetCampingSiteUseCase {
  Future<List<CampingSite>> getCampingSite();
}
