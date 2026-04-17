import 'package:url_launcher/url_launcher.dart';

abstract class ILaunchUrlInterface {
  Future<void> openURL(String url);
}

class TextRepeaterLaunchUrl implements ILaunchUrlInterface {
  const TextRepeaterLaunchUrl();
  @override
  Future<void> openURL(String url) async {
    final uRL = Uri.parse(url);
    if (await canLaunchUrl(uRL)) {
      await launchUrl(uRL, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $uRL';
    }
  }
}
