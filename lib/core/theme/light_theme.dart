import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    dividerColor: Colors.grey[100],
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
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
