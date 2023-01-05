import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constant.dart';
import 'index.dart';
import 'theme.dart';

void main() {
  //Now we use SystemChrome
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //Lets make the Status Bar Transparent
    statusBarColor: Colors.transparent,

    //Lets make the status bar icon brightness to bright
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await readJson();
      await getSettings();
    });
    super.initState();
   
  }

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akra',
      theme: getThemData(),
      home: const IndexPage(),
    );
  }
}
