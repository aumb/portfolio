import 'package:image_picker/image_picker.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/core/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class FreelanceController {
  BehaviorSubject<String> _url;
  BehaviorSubject<String> _description;
  BehaviorSubject<PickedFile> _image;
  BehaviorSubject<bool> _isLoading;

  UserService _service;

  RecentWork recentWork;

  FreelanceController({this.recentWork}) {
    _url = BehaviorSubject<String>.seeded(null);
    _description = BehaviorSubject<String>.seeded(null);
    _image = BehaviorSubject<PickedFile>.seeded(null);
    _isLoading = BehaviorSubject<bool>.seeded(false);

    _service = UserService();

    setupValues();
  }

  //Stream getters
  Stream<String> get urlStream => _url.stream;
  Stream<String> get descriptionStream => _description.stream;
  Stream<PickedFile> get imageStream => _image.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;

  //Stream combiners
  Stream<bool> get allStreams => Rx.combineLatest4(
        urlStream,
        descriptionStream,
        imageStream,
        isLoadingStream,
        (a, b, c, d) => true,
      );

  //Combiner values
  bool get canSubmitChanges =>
      isNotEmpty(url) &&
      isNotEmpty(description) &&
      image != null &&
      didValuesChange();

  //Value getters
  String get url => _url.value;
  String get description => _description.value;
  PickedFile get image => _image.value;
  bool get isLoading => _isLoading.value;

  //Value setters
  set url(String value) {
    if (!_url.isClosed) _url.add(value);
  }

  set description(String value) {
    if (!_description.isClosed) _description.add(value);
  }

  set image(PickedFile value) {
    if (recentWork != null && value == null) {
      image = PickedFile(recentWork.img);
    }
    if (!_image.isClosed) _image.add(value);
  }

  set isLoading(bool value) {
    if (!_isLoading.isClosed) _isLoading.add(value);
  }

  //Future Functions
  Future<RecentWork> postRecentWork() {
    RecentWork _recentWork = RecentWork(
      id: recentWork?.id,
      url: url,
      description: description,
    );

    isLoading = true;
    return _service.postRecentWork(_recentWork, image).catchError((e) {
      print(e);
    }).whenComplete(() {
      isLoading = false;
    });
  }

  Future<RecentWork> deleteRecentWork() {
    isLoading = true;
    return _service.deleteRecentWork(recentWork.id).catchError((e) {
      print(e);
    }).whenComplete(() {
      isLoading = false;
    });
  }

  //Functions
  void setupValues() {
    if (recentWork != null) {
      url = recentWork.url;
      description = recentWork.description;
      image = PickedFile(recentWork.img);
    }
  }

  bool didValuesChange() {
    bool didChange = false;

    if (url != recentWork?.url ||
        description != recentWork?.description ||
        image?.path != recentWork.img) {
      didChange = true;
    }

    return didChange;
  }

  void dispose() {
    if (!_url.isClosed) _url.close();
    if (!_description.isClosed) _description.close();
    if (!_image.isClosed) _image.close();
    if (!_isLoading.isClosed) _isLoading.close();
  }
}
