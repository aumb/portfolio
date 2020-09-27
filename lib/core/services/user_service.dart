import 'package:dio/dio.dart';
import 'package:portfolio/core/core.dart';

class UserService {
  Future<dynamic> getUserProfilePicture(int userId) {
    String url = API.profilePicture + "/" + userId.toString();
    return NetworkManager.get(
      url,
      responseType: ResponseType.bytes,
    );
  }
}
