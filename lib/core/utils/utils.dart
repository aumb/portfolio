import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

String getStrDate(DateTime date,
    {String pattern, String locale, bool addTimeZone = false}) {
  DateFormat defaultFormat = locale != null
      ? DateFormat('dd/MM/yyyy', locale)
      : DateFormat('dd/MM/yyyy');

  if (date == null || date.millisecondsSinceEpoch == 0) {
    return null;
  }

  DateFormat format;
  if (pattern != null) {
    try {
      format =
          locale != null ? DateFormat(pattern, locale) : DateFormat(pattern);
    } on Exception catch (e) {
      throw ('errorDatePattern: $e');
    }
  }

  String formattedDate;
  if (format != null) {
    formattedDate = format.format(date);
  } else {
    formattedDate = defaultFormat.format(date);
  }
  if (addTimeZone ?? false) formattedDate += ' ' + date.timeZoneName;

  return formattedDate;
}

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
