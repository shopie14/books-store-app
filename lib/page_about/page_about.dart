import 'package:flutter/material.dart';
import 'package:habit_tracker/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class PageAbout extends StatefulWidget {
  const PageAbout({
    super.key,
  });

  @override
  State<PageAbout> createState() => _PageAbout();
}

class _PageAbout extends State<PageAbout> {
  void _openGithubSourceCode() async {
    final Uri githubUrl = Uri(
        scheme: 'https',
        host: 'www.github.com',
        path: 'accountability-tracker/habit_tracker');
    if (!await launchUrl(
      githubUrl,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $githubUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About",
        ),
        backgroundColor: customColors.navbarBackground,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: Container(
        // margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        color: customColors.background,
        // width: MediaQuery.of(context).size.width * 0.9,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Nama Lengkap",
              style: TextStyle(color: customColors.progressBarForeground),
            ),
            const Text(
              "Shopi Nurhidayanti",
            ),
            Divider(
              thickness: 0.25,
              color: customColors.dividerColor,
            ),
            Text(
              "NIM",
              style: TextStyle(color: customColors.progressBarForeground),
            ),
            const Text(
              "2006061",
            ),
            Divider(
              thickness: 0.25,
              color: customColors.dividerColor,
            ),
            Text(
              "Mata Kuliah",
              style: TextStyle(color: customColors.progressBarForeground),
            ),
            const Text(
              "Pemrograman Mobile and Prak Pemrograman Mobile",
            ),
            Divider(
              thickness: 0.25,
              color: customColors.dividerColor,
            ),
            Text(
              "Applicaion",
              style: TextStyle(color: customColors.progressBarForeground),
            ),
            const Text(
                "Habit Tracker adalah sebuah aplikasi atau alat yang dirancang untuk membantu pengguna dalam mengelola dan melacak kebiasaan atau rutinitas sehari-hari user. Tujuan utama dari Habit Tracker adalah membantu pengguna dalam membangun kebiasaan yang lebih baik dan meningkatkan produktivitas serta kesejahteraan secara keseluruhan.",
                textAlign: TextAlign.justify),
          ],
        ),
      ),
    );
  }
}
