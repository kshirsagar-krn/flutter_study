import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';

class ExtraMethods {
  // Get WhatsApp URL with number and optional message
  String getWhatsAppUrl(String number, [String msg = '']) {
    return 'https://wa.me/91$number?text=$msg';
  }

  // Make a phone call
  void makeCall(String number) async {
    final url = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      log('Could not launch $url');
    }
  }

  // Send an email with optional subject
  void makeMail(String email, [String subject = '']) {
    try {
      final emailLaunchUri = Uri(
          scheme: 'mailto', path: email, queryParameters: {'subject': subject});
      final url = emailLaunchUri.toString().replaceAll('+', ' ');
      launchInBrowser(url);
    } catch (e) {
      log(e.toString(), name: "Error at makeMail");
    }
  }

  // Launch a URL in the browser
  static Future<void> launchInBrowser(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'},
        ),
      );
    } else {
      log('Could not launch $url');
    }
  }

  // Launch a website, ensuring it starts with 'https://'
  static Future<void> launchWebsite(String url) async {
    if (!url.startsWith('http')) {
      url = 'https://$url';
    }
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalNonBrowserApplication,
      );
    } else {
      log('Could not launch $url');
    }
  }
}
