import 'package:portfolio/core/core.dart';
import 'package:portfolio/core/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class LoginController {
  BehaviorSubject<String> _email;
  BehaviorSubject<String> _password;
  BehaviorSubject<bool> _isLoading;

  UserService _service;

  LoginController() {
    _email = BehaviorSubject<String>.seeded(null);
    _password = BehaviorSubject<String>.seeded(null);
    _isLoading = BehaviorSubject<bool>.seeded(false);

    _service = UserService();
  }

  //Stream getters
  Stream<String> get emailStream => _email.stream;
  Stream<String> get passwordStream => _password.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;

  //Stream combiners
  Stream<bool> get canLoginStream => Rx.combineLatest3(
      emailStream, passwordStream, isLoadingStream, (a, b, c) => true);

  //Combiner values
  bool get canLogin => isNotEmpty(email) && isNotEmpty(password);

  //Getters
  String get email => _email.value;
  String get password => _password.value;
  bool get isLoading => _isLoading.value;

  //Setters
  set email(String value) {
    if (!_email.isClosed) _email.add(value);
  }

  set password(String value) {
    if (!_password.isClosed) _password.add(value);
  }

  set isLoading(bool value) {
    if (!_isLoading.isClosed) _isLoading.add(value);
  }

  //Future functions
  Future<User> login() {
    isLoading = true;
    return _service
        .login(email, password)
        .whenComplete(() => isLoading = false);
  }

  //Functions
  void dispose() {
    if (!_email.isClosed) _email.close();
    if (!_password.isClosed) _password.close();
    if (!_isLoading.isClosed) _isLoading.close();
  }
}
