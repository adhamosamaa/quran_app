import 'package:flutter/material.dart';

ThemeData getThemData() => ThemeData(
      // primarySwatch: Colors.amber,
      

      fontFamily: 'Tajawal',
      appBarTheme: const AppBarTheme(
        foregroundColor: Color(
          0xffFEFAE0,
        ),
        iconTheme: IconThemeData(
          color: Color(
            0xffFEFAE0,
          ),
        ),
        color: Color(
          0xffD4A373,
        ),
        elevation: 0,
        centerTitle: true,
      ),
    );
