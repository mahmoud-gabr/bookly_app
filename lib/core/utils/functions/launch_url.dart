import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String url) async {
  Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $url');
  }
  // if (await canLaunchUrl(uri)) {
  //   launchUrl(uri);
  // } else {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('cannot launcg $url'),
  //     ),
  //   );
  // }
}
