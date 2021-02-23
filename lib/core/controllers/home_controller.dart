import 'package:portfolio/core/core.dart';
import 'package:rxdart/rxdart.dart';

class HomeController {
  BehaviorSubject<PageState> _pageState;
  BehaviorSubject<bool> _isLoading;

  Information information;

  HomeService _service;

  HomeController() {
    _pageState = BehaviorSubject<PageState>.seeded(null);
    _isLoading = BehaviorSubject<bool>.seeded(false);

    _service = HomeService();
  }

  //Stream getters
  Stream<PageState> get pageStateStream => _pageState.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;

  //Stream combiners
  Stream<bool> get pageStream =>
      Rx.combineLatest2(pageStateStream, isLoadingStream, (a, b) => true);

  //Getters
  PageState get pageState => _pageState.value;
  bool get isLoading => _isLoading.value;

  //Setters
  set pageState(PageState value) {
    if (!_pageState.isClosed) _pageState.add(value);
  }

  set isLoading(bool value) {
    if (!_isLoading.isClosed) _isLoading.add(value);
  }

  //Future functions
  Future<void> getInformation() async {
    pageState = PageState.loading;
    try {
      information = await _service.getInformation();
      pageState = PageState.loaded;
    } catch (e) {
      print(e);
      pageState = PageState.error;
    }
  }

  Future<void> refreshInformation() async {
    isLoading = true;
    try {
      CacheManager().invalidateCacheAndRestart();
      information = await _service.getInformation();
      isLoading = false;
    } catch (e) {
      print(e);
      isLoading = false;
    }
  }

  void dispose() {
    if (!_pageState.isClosed) _pageState.close();
    if (!_isLoading.isClosed) _isLoading.close();
  }
}
