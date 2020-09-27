import 'package:portfolio/core/core.dart';

class HomeService {
  Future<Information> getInformation() {
    return NetworkManager.get(API.information).then(
      (value) => Information.fromJson(value),
    );
  }
}
