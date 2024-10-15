import 'package:url_launcher/url_launcher.dart';

class Utils {
  static scheduleEventOnCalender({required String weddingDate}) {
    final reminderDate =
        DateTime.parse(weddingDate).subtract(const Duration(days: 1));
    final url = Uri.encodeFull(
        'https://www.google.com/calendar/render?action=TEMPLATE'
        '&text=Jay and Rashmi\'s wedding'
        '&dates=${reminderDate.toIso8601String().replaceAll('-', '').replaceAll(':', '')}/$weddingDate'
        '&details=Don\'t forget the wedding!');

    launchUrl(Uri.parse(url));
  }

  static navigateToDestination(
      {required double lat, required double long}) async {
    final url = Uri.parse(
        'https://www.google.com/maps/dir/?api=1&destination=$lat,$long&travelmode=driving');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
