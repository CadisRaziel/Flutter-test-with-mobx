import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
 Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

    ///Como criei um metodo privado acima preciso meio que um metodo 'get' para acessa-lo
   Future<void> launch(Uri url) async {
    await _launchUrl(url);
  }
}