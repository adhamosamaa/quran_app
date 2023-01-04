import 'package:flutter/material.dart';
import 'constant.dart';

class SettingsFonts extends StatefulWidget {
  const SettingsFonts({Key? key}) : super(key: key);

  @override
  State<SettingsFonts> createState() => _SettingsFontsState();
}

class _SettingsFontsState extends State<SettingsFonts> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Color(
          0xffFEFAE0,
        ),
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            "الإعدادات",
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Arabic Font Size:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Slider(
                    activeColor: Color(
                      0xffD4A373,
                    ),
                    inactiveColor: Color(
                      0xffFAEDCD,
                    ),
                    value: arabicFontSize,
                    min: 20,
                    max: 40,
                    onChanged: (value) {
                      setState(() {
                        arabicFontSize = value;
                      });
                    },
                  ),
                  Text(
                    "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ",
                    style: TextStyle(
                        fontFamily: 'quran', fontSize: arabicFontSize),
                    textDirection: TextDirection.rtl,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(),
                  ),
                  const Text(
                    'Mushaf Mode Font Size:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Slider(
                    activeColor: Color(
                      0xffD4A373,
                    ),
                    inactiveColor: Color(
                      0xffFAEDCD,
                    ),
                    value: mushafFontSize,
                    min: 20,
                    max: 50,
                    onChanged: (value) {
                      setState(() {
                        mushafFontSize = value;
                      });
                    },
                  ),
                  Text(
                    "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ",
                    style: TextStyle(
                        fontFamily: 'quran', fontSize: mushafFontSize),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            backgroundColor: Color(
                              0xffD4A373,
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {
                            setState(() {
                              arabicFontSize = 28;
                              mushafFontSize = 40;
                            });
                            saveSettings();
                          },
                          child: const Text('الأفتراضي')),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            backgroundColor: Color(
                              0xffD4A373,
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {
                            saveSettings();
                            Navigator.of(context).pop();
                          },
                          child: const Text('حفظ')),
                    ],
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
