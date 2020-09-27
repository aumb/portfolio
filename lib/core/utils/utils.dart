import 'package:url_launcher/url_launcher.dart';

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
