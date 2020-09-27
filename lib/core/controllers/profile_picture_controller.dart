import 'dart:typed_data';

import 'package:portfolio/core/core.dart';
import 'package:rxdart/rxdart.dart';

class ProfilePictureController {
  BehaviorSubject<bool> _isLoading;
  BehaviorSubject<Uint8List> _profilePicture;

  UserService _service;

  static final ProfilePictureController _instance =
      ProfilePictureController._internal();

  ProfilePictureController._internal() {
    _isLoading = BehaviorSubject<bool>.seeded(_isLoading?.value ?? false);
    _profilePicture =
        BehaviorSubject<Uint8List>.seeded(_profilePicture?.value ?? null);

    _service = UserService();
  }

  factory ProfilePictureController() {
    return _instance;
  }

  //Stream combiners
  Observable<bool> get combinedStream => Observable.combineLatest2(
        isLoadingStream,
        profilePictureStream,
        (a, b) => combiner,
      );

  //Value combiners
  bool get combiner => isLoading;

  //Stream getters
  Observable<bool> get isLoadingStream => _isLoading.stream;
  Observable<Uint8List> get profilePictureStream => _profilePicture.stream;

  //Value getters
  bool get isLoading => _isLoading.value;
  Uint8List get profilePicture => _profilePicture.value;

  //Value setters
  set isLoading(bool value) {
    if (!_isLoading.isClosed) _isLoading.add(value);
  }

  set profilePicture(Uint8List value) {
    if (!_profilePicture.isClosed) _profilePicture.add(value);
  }

  //Functions
  Future<void> getUserProfilePicture(int id) async {
    isLoading = true;
    return _service.getUserProfilePicture(id).then((response) {
      profilePicture = response;
    }).catchError((e) {
      print(e);
      profilePicture = null;
    }).whenComplete(() {
      isLoading = false;
    });
  }

  void dispose() {
    if (!_isLoading.isClosed) _isLoading.close();
    if (!_profilePicture.isClosed) _profilePicture.close();
  }
}
