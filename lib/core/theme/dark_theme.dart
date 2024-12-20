import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[900],
    dividerColor: Colors.grey[700],
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(backgroundColor: Colors.grey[900]),
    textTheme: TextTheme(
        bodyMedium: TextStyle(fontFamily: 'Inter', fontSize: 12.sp),
        bodyLarge: TextStyle(
            fontFamily: 'Inter', fontSize: 12.sp, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12.sp,
            color: Colors.grey[600],
            fontWeight: FontWeight.w700),
        headlineLarge: TextStyle(
            fontFamily: 'Inter', fontWeight: FontWeight.bold, fontSize: 20.sp))

    // Define additional light theme properties here
    );
