import 'package:image_picker/image_picker.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/core/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class PersonalInformationController {
  BehaviorSubject<String> _name;
  BehaviorSubject<String> _about;
  BehaviorSubject<String> _aboutHeader;
  BehaviorSubject<String> _jobHeader;
  BehaviorSubject<String> _job;
  BehaviorSubject<String> _contactHeader;
  BehaviorSubject<String> _contactSubHeader;
  BehaviorSubject<String> _phoneNumber;
  BehaviorSubject<String> _email;
  BehaviorSubject<String> _facebook;
  BehaviorSubject<String> _linkedin;
  BehaviorSubject<String> _github;
  BehaviorSubject<String> _instagram;
  BehaviorSubject<String> _twitter;
  BehaviorSubject<PageState> _pageState;
  BehaviorSubject<bool> _isLoading;
  BehaviorSubject<PickedFile> _image;

  UserService _service;

  PersonalInformation personal;

  PersonalInformationController(this.personal) {
    _name = BehaviorSubject<String>.seeded(null);
    _aboutHeader = BehaviorSubject<String>.seeded(null);
    _about = BehaviorSubject<String>.seeded(null);
    _jobHeader = BehaviorSubject<String>.seeded(null);
    _job = BehaviorSubject<String>.seeded(null);
    _contactHeader = BehaviorSubject<String>.seeded(null);
    _contactSubHeader = BehaviorSubject<String>.seeded(null);
    _phoneNumber = BehaviorSubject<String>.seeded(null);
    _email = BehaviorSubject<String>.seeded(null);
    _facebook = BehaviorSubject<String>.seeded(null);
    _linkedin = BehaviorSubject<String>.seeded(null);
    _github = BehaviorSubject<String>.seeded(null);
    _instagram = BehaviorSubject<String>.seeded(null);
    _twitter = BehaviorSubject<String>.seeded(null);
    _pageState = BehaviorSubject<PageState>.seeded(PageState.loaded);
    _isLoading = BehaviorSubject<bool>.seeded(false);
    _image = BehaviorSubject<PickedFile>.seeded(null);

    _service = UserService();

    setupValues();
  }

  //Stream getters
  Stream<String> get nameStream => _name.stream;
  Stream<String> get aboutHeaderStream => _aboutHeader.stream;
  Stream<String> get aboutStream => _about.stream;
  Stream<String> get jobHeaderStream => _jobHeader.stream;
  Stream<String> get jobStream => _job.stream;
  Stream<String> get contactHeaderStream => _contactHeader.stream;
  Stream<String> get contactSubHeaderStream => _contactSubHeader.stream;
  Stream<String> get phoneNumberStream => _phoneNumber.stream;
  Stream<String> get emailStream => _email.stream;
  Stream<String> get facebookStream => _facebook.stream;
  Stream<String> get linkedinStream => _linkedin.stream;
  Stream<String> get githubStream => _github.stream;
  Stream<String> get instagramStream => _instagram.stream;
  Stream<String> get twitterStream => _twitter.stream;
  Stream<PageState> get pageStateStream => _pageState.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;
  Stream<PickedFile> get imageStream => _image.stream;

  //Stream Combiners
  Stream<bool> get personalInformationStream => Rx.combineLatest3(
      nameStream, aboutHeaderStream, aboutStream, (a, b, c) => true);

  Stream<bool> get jobInformationStream => Rx.combineLatest2(
        jobHeaderStream,
        jobStream,
        (a, b) => true,
      );

  Stream<bool> get contactInformationStream => Rx.combineLatest9(
        contactHeaderStream,
        contactSubHeaderStream,
        emailStream,
        phoneNumberStream,
        facebookStream,
        twitterStream,
        githubStream,
        instagramStream,
        linkedinStream,
        (a, b, c, d, e, f, g, h, i) => true,
      );

  Stream<bool> get allStreams => Rx.combineLatest6(
        personalInformationStream,
        jobInformationStream,
        contactInformationStream,
        pageStateStream,
        isLoadingStream,
        imageStream,
        (a, b, c, d, e, f) => true,
      );

  //Value getters
  String get name => _name.value;
  String get aboutHeader => _aboutHeader.value;
  String get about => _about.value;
  String get jobHeader => _jobHeader.value;
  String get job => _job.value;
  String get contactHeader => _contactHeader.value;
  String get contactSubHeader => _contactSubHeader.value;
  String get phoneNumber => _phoneNumber.value;
  String get email => _email.value;
  String get facebook => _facebook.value;
  String get linkedin => _linkedin.value;
  String get github => _github.value;
  String get instagram => _instagram.value;
  String get twitter => _twitter.value;
  PageState get pageState => _pageState.value;
  bool get isLoading => _isLoading.value;
  bool get canSubmit => didValuesChange() && !areValuesEmpty();
  PickedFile get image => _image.value;

  //Value setters
  set name(String value) {
    if (!_name.isClosed) _name.add(value);
  }

  set aboutHeader(String value) {
    if (!_aboutHeader.isClosed) _aboutHeader.add(value);
  }

  set about(String value) {
    if (!_about.isClosed) _about.add(value);
  }

  set jobHeader(String value) {
    if (!_jobHeader.isClosed) _jobHeader.add(value);
  }

  set job(String value) {
    if (!_job.isClosed) _job.add(value);
  }

  set contactHeader(String value) {
    if (!_contactHeader.isClosed) _contactHeader.add(value);
  }

  set contactSubHeader(String value) {
    if (!_contactSubHeader.isClosed) _contactSubHeader.add(value);
  }

  set phoneNumber(String value) {
    if (!_phoneNumber.isClosed) _phoneNumber.add(value);
  }

  set email(String value) {
    if (!_email.isClosed) _email.add(value);
  }

  set facebook(String value) {
    if (!_facebook.isClosed) _facebook.add(value);
  }

  set linkedin(String value) {
    if (!_linkedin.isClosed) _linkedin.add(value);
  }

  set github(String value) {
    if (!_github.isClosed) _github.add(value);
  }

  set instagram(String value) {
    if (!_instagram.isClosed) _instagram.add(value);
  }

  set twitter(String value) {
    if (!_twitter.isClosed) _twitter.add(value);
  }

  set pageState(PageState value) {
    if (!_pageState.isClosed) _pageState.add(value);
  }

  set isLoading(bool value) {
    if (!_isLoading.isClosed) _isLoading.add(value);
  }

  set image(PickedFile value) {
    if (!_image.isClosed) _image.add(value);
  }

  //Future functions
  Future<PersonalInformation> postPersonalInformation() {
    PersonalInformation personalInformation = PersonalInformation(
      id: personal.id,
      name: name,
      aboutTitle: aboutHeader,
      about: about,
      jobTitle: jobHeader,
      jobSubtitle: job,
      contactTitle: contactHeader,
      contactSubtitle: contactSubHeader,
      phoneNumber: phoneNumber,
      email: email,
      facebookUrl: facebook,
      linkedInUrl: linkedin,
      githubUrl: github,
      instagramUrl: instagram,
      twitterUrl: twitter,
    );

    isLoading = true;
    return _service
        .postPersonalInformation(personalInformation, image)
        .then((value) {
      personal = value;
      setupValues();
      return value;
    }).catchError((e) {
      print(e);
    }).whenComplete(() {
      isLoading = false;
    });
  }

  //Functions
  void setupValues() {
    name = personal.name;
    aboutHeader = personal.aboutTitle;
    about = personal.about;
    jobHeader = personal.jobTitle;
    job = personal.jobSubtitle;
    contactHeader = personal.contactTitle;
    contactSubHeader = personal.contactSubtitle;
    phoneNumber = personal.phoneNumber;
    email = personal.email;
    facebook = personal.facebookUrl;
    linkedin = personal.linkedInUrl;
    github = personal.githubUrl;
    instagram = personal.instagramUrl;
    twitter = personal.twitterUrl;
  }

  bool didValuesChange() {
    bool didChange = false;

    if (name != personal.name ||
        aboutHeader != personal.aboutTitle ||
        about != personal.about ||
        jobHeader != personal.jobTitle ||
        job != personal.jobSubtitle ||
        contactHeader != personal.contactTitle ||
        contactSubHeader != personal.contactSubtitle ||
        facebook != personal.facebookUrl ||
        linkedin != personal.linkedInUrl ||
        github != personal.githubUrl ||
        instagram != personal.instagramUrl ||
        twitter != personal.twitterUrl ||
        image != null) {
      didChange = true;
    }

    return didChange;
  }

  bool areValuesEmpty() {
    bool areEmpty = true;

    if (isNotEmpty(name) &&
        isNotEmpty(aboutHeader) &&
        isNotEmpty(about) &&
        isNotEmpty(jobHeader) &&
        isNotEmpty(job) &&
        isNotEmpty(contactHeader) &&
        isNotEmpty(contactSubHeader) &&
        isNotEmpty(phoneNumber) &&
        isNotEmpty(email)) {
      areEmpty = false;
    }

    return areEmpty;
  }

  void dispose() {
    if (!_name.isClosed) _name.close();
    if (!_aboutHeader.isClosed) _aboutHeader.close();
    if (!_about.isClosed) _about.close();
    if (!_jobHeader.isClosed) _jobHeader.close();
    if (!_job.isClosed) _job.close();
    if (!_contactHeader.isClosed) _contactHeader.close();
    if (!_contactSubHeader.isClosed) _contactSubHeader.close();
    if (!_facebook.isClosed) _facebook.close();
    if (!_linkedin.isClosed) _linkedin.close();
    if (!_github.isClosed) _github.close();
    if (!_instagram.isClosed) _instagram.close();
    if (!_twitter.isClosed) _name.close();
    if (!_image.isClosed) _image.close();
  }
}
