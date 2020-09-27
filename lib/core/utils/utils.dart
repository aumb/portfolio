import 'package:url_launcher/url_launcher.dart';

/// Returns [true] if [s] is either null or empty.
bool isEmpty(String s) => s == null || s.isEmpty || s == 'null';

/// Returns [true] if [s] is a not null or empty string.
bool isNotEmpty(String s) => s != null && s.isNotEmpty && s != 'null';

void launchUrls({String scheme, String path}) {
  if (scheme == "https" || scheme == "http") {
    launch(path);
    return;
  }
  final Uri uri = Uri(
    scheme: scheme,
    path: path,
  );

  launch(uri.toString());
}
