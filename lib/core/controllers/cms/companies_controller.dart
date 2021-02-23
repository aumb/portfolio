import 'package:image_picker/image_picker.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/core/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class CompaniesController {
  BehaviorSubject<String> _title;
  BehaviorSubject<String> _name;
  BehaviorSubject<String> _link;
  BehaviorSubject<String> _description;
  BehaviorSubject<DateTime> _startDate;
  BehaviorSubject<DateTime> _endDate;
  BehaviorSubject<PickedFile> _image;
  BehaviorSubject<bool> _isLoading;

  UserService _service;

  Job job;

  CompaniesController({this.job}) {
    _title = BehaviorSubject<String>.seeded(null);
    _name = BehaviorSubject<String>.seeded(null);
    _link = BehaviorSubject<String>.seeded(null);
    _description = BehaviorSubject<String>.seeded(null);
    _startDate = BehaviorSubject<DateTime>.seeded(null);
    _endDate = BehaviorSubject<DateTime>.seeded(null);
    _image = BehaviorSubject<PickedFile>.seeded(null);
    _isLoading = BehaviorSubject<bool>.seeded(false);

    _service = UserService();

    setupValues();
  }

  //Stream getters
  Stream<String> get titleStream => _title.stream;
  Stream<String> get nameStream => _name.stream;
  Stream<String> get linkStream => _link.stream;
  Stream<String> get descriptionStream => _description.stream;
  Stream<DateTime> get startDateStream => _startDate.stream;
  Stream<DateTime> get endDateStream => _endDate.stream;
  Stream<PickedFile> get imageStream => _image.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;

  //Stream combiners
  Stream<bool> get allStreams => Rx.combineLatest8(
        titleStream,
        nameStream,
        linkStream,
        descriptionStream,
        startDateStream,
        endDateStream,
        imageStream,
        isLoadingStream,
        (a, b, c, d, e, f, g, h) => canSubmitChanges,
      );

  //Combiner values
  bool get canSubmitChanges =>
      isNotEmpty(title) &&
      isNotEmpty(name) &&
      isNotEmpty(description) &&
      startDate != null &&
      image != null &&
      didValuesChange();

  //Value getters
  String get title => _title.value;
  String get name => _name.value;
  String get link => _link.value;
  String get description => _description.value;
  DateTime get startDate => _startDate.value;
  DateTime get endDate => _endDate.value;
  PickedFile get image => _image.value;
  bool get isLoading => _isLoading.value;

  //Value setters
  set title(String value) {
    if (!_title.isClosed) _title.add(value);
  }

  set name(String value) {
    if (!_name.isClosed) _name.add(value);
  }

  set link(String value) {
    if (!_link.isClosed) _link.add(value);
  }

  set description(String value) {
    if (!_description.isClosed) _description.add(value);
  }

  set startDate(DateTime value) {
    if (!_startDate.isClosed) _startDate.add(value);
  }

  set endDate(DateTime value) {
    if (!_endDate.isClosed) _endDate.add(value);
  }

  set image(PickedFile value) {
    if (job != null && value == null) {
      image = PickedFile(job.image);
    }
    if (!_image.isClosed) _image.add(value);
  }

  set isLoading(bool value) {
    if (!_isLoading.isClosed) _isLoading.add(value);
  }

  //Future Functions
  Future<Job> postJob() {
    Job _job = Job(
      id: job?.id,
      title: title,
      companyName: name,
      companyLink: link,
      description: description,
      startDate: startDate,
      endDate: endDate,
    );

    isLoading = true;
    return _service.postJob(_job, image).catchError((e) {
      print(e);
    }).whenComplete(() {
      isLoading = false;
    });
  }

  Future<Job> deleteRecentWork() {
    isLoading = true;
    return _service.deleteJob(job.id).catchError((e) {
      print(e);
    }).whenComplete(() {
      isLoading = false;
    });
  }

  //Functions
  void setupValues() {
    if (job != null) {
      title = job.title;
      name = job.companyName;
      link = job.companyLink;
      description = job.description;
      image = PickedFile(job.image);
      startDate = job.startDate;
      endDate = job.endDate;
    }
  }

  bool didValuesChange() {
    bool didChange = false;

    if (title != job?.title ||
        name != job?.companyName ||
        link != job?.companyLink ||
        description != job.description ||
        image?.path != job?.image ||
        startDate != job?.startDate ||
        endDate != job?.endDate) {
      didChange = true;
    }

    return didChange;
  }

  void dispose() {
    if (!_title.isClosed) _title.close();
    if (!_name.isClosed) _name.close();
    if (!_link.isClosed) _link.close();
    if (!_description.isClosed) _description.close();
    if (!_startDate.isClosed) _startDate.close();
    if (!_endDate.isClosed) _endDate.close();
    if (!_image.isClosed) _image.close();
    if (!_isLoading.isClosed) _isLoading.close();
  }
}
