import 'package:quran/constant.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:quran/settingsFonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xffFAEDCD),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xffD4A373),
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/quran.png",
                  height: 100,
                ),
                Text(
                  'اللَّهُــمَّ صـَلِّ وَسَـلِّمْ علـى نَبِيِّنَـا مُحمَّد ﷺ﻿',
                  style: TextStyle(
                    fontFamily: "quran",
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
            leading: Icon(
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsFonts()));
            },
          ),
          ListTile(
            leading: Icon(
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
            leading: Icon(
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
        ],
      ),
    );
  }
}
