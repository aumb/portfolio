import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/core/utils/utils.dart';

class UserService {
  Future<dynamic> getUserProfilePicture(int userId) {
    String url = API.profilePicture + "/" + userId.toString();
    return NetworkManager.get(
      url,
      responseType: ResponseType.bytes,
    );
  }

  Future<PersonalInformation> postPersonalInformation(
    PersonalInformation personalInformation,
    PickedFile image,
  ) async {
    FormData body = FormData.fromMap(personalInformation.toJson());
    if (image != null) {
      final bytes = await image.readAsBytes();
      final MultipartFile file =
          MultipartFile.fromBytes(bytes, filename: "profilepicture");
      MapEntry<String, MultipartFile> imageEntry = MapEntry("image", file);
      body.files.add(imageEntry);
    }
    return NetworkManager.post(
      API.personalInformation,
      body,
    ).then((value) => PersonalInformation.fromJson(value));
  }

  Future<RecentWork> postRecentWork(
    RecentWork recentWork,
    PickedFile image,
  ) async {
    FormData body = FormData.fromMap(recentWork.toJson());
    if (image != null && !image.path.startsWith("cv/")) {
      final bytes = await image.readAsBytes();
      final MultipartFile file =
          MultipartFile.fromBytes(bytes, filename: "recentWork");
      MapEntry<String, MultipartFile> imageEntry = MapEntry("image", file);
      body.files.add(imageEntry);
    }
    return NetworkManager.post(
      API.recentWork,
      body,
    ).then((value) => RecentWork.fromJson(value));
  }

  Future<RecentWork> deleteRecentWork(int id) {
    return NetworkManager.delete(API.recentWork + "/" + id.toString())
        .then((value) => RecentWork.fromJson(value));
  }

  Future<Job> postJob(
    Job job,
    PickedFile image,
  ) async {
    FormData body = FormData.fromMap(job.toJson());
    if (image != null && !image.path.startsWith("cv/")) {
      final bytes = await image.readAsBytes();
      final MultipartFile file =
          MultipartFile.fromBytes(bytes, filename: "job");
      MapEntry<String, MultipartFile> imageEntry = MapEntry("image", file);
      body.files.add(imageEntry);
    }
    return NetworkManager.post(
      API.job,
      body,
    ).then((value) => Job.fromJson(value));
  }

  Future<Job> deleteJob(int id) {
    return NetworkManager.delete(API.job + "/" + id.toString())
        .then((value) => Job.fromJson(value));
  }

  Future<User> login(String email, String password) {
    FormData body = FormData.fromMap({
      if (isNotEmpty(email)) 'email': email,
      if (isNotEmpty(password)) 'password': password,
    });
    return NetworkManager.post(API.login, body).then(
      (value) => User.fromJson(value),
    );
  }
}
