import 'package:flutter/material.dart';

class SurahDrawer extends StatefulWidget {
  const SurahDrawer({super.key});

  @override
  State<SurahDrawer> createState() => _SurahDrawerState();
}

class _SurahDrawerState extends State<SurahDrawer> {
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
        ],
      ),
    );
  }
}
