import 'package:url_launcher/url_launcher.dart';

class Browser {
  static Future<void> open(String url) async {
    final Uri parsedUrl = Uri.parse(url);
    if(!await launchUrl(parsedUrl)) {
      throw "Could not launch $url";
    }
  }
}