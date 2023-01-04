import 'package:flutter/material.dart';
import 'package:quran/settingsFonts.dart';
import 'package:share_plus/share_plus.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Color(
          0xffFEFAE0,
        ),
        appBar: AppBar(
          elevation: 0,
          title: Text('الإعدادات'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
            leading: Icon(
              Icons.favorite_rounded,
            ),
            title: const Text('انشر التطبيق'),
            onTap: () {
              Share.share('التطبيق الأمثل لقراءة القران الكريم');
              Navigator.pop(context);
            },
          ),
           ListTile(
            leading: Icon(
              Icons.favorite_rounded,
            ),
            title: const Text('حجم الخط'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SettingsFonts()));
            },
          ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
