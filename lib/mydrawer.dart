import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';

import 'constant.dart';
import 'settingsFonts.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  TextEditingController dataSUGController = TextEditingController();
  String dataSuggest = '';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffFAEDCD),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xffD4A373),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/quran.png",
                    height: 100,
                  ),
                  const Text(
                    'اللَّهُــمَّ صـَلِّ وَسَـلِّمْ علـى نَبِيِّنَـا مُحمَّد ﷺ﻿',
                    style: TextStyle(
                      fontFamily: "me_quran",
                      fontSize: 16,
                      color: Color(
                        0xffFAEDCD,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings_rounded,
                color: Color(
                  0xffD4A373,
                ),
              ),
              title: const Text(
                'الإعدادات',
                style: TextStyle(
                  color: Color(
                    0xffD4A373,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsFonts()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite_rounded,
                color: Color(
                  0xffD4A373,
                ),
              ),
              title: const Text('انشر التطبيق',
                  style: TextStyle(
                    color: Color(
                      0xffD4A373,
                    ),
                  )),
              onTap: () {
                Share.share('أقرأ - التطبيق الأمثل لقراءة القران الكريم!');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.star_rate_rounded,
                color: Color(
                  0xffD4A373,
                ),
              ),
              title: const Text('قيم التطبيق',
                  style: TextStyle(
                    color: Color(
                      0xffD4A373,
                    ),
                  )),
              onTap: () async {
                if (!await launchUrl(quranAppurl,
                    mode: LaunchMode.externalApplication)) {
                  throw 'Could not launch $quranAppurl';
                }
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.assistant_rounded,
                color: Color(
                  0xffD4A373,
                ),
              ),
              title: const Text('ابعتلنا اقتراحك',
                  style: TextStyle(
                    color: Color(
                      0xffD4A373,
                    ),
                  )),
              onTap: () {
                _dialogBuilder(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('تحب نضيف ايه في التطبيق'),
          content: Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              autofocus: true,
              textAlign: TextAlign.right,
              controller: dataSUGController,
              onSubmitted: (submittedValue) {
                print('Submitted value: $submittedValue');
              },
              decoration: const InputDecoration(
                labelText: 'اقتراحك',
                border: OutlineInputBorder(),
              ),
              maxLines: 10,
              minLines: 1,
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'ابعت',
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          actionsAlignment: MainAxisAlignment.start,
        );
      },
    );
  }
}
