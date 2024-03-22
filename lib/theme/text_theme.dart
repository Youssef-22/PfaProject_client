import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge:const TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.black,),
    headlineMedium:const TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.black,),

    titleLarge:const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black,),
    titleMedium:const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black,),
    titleSmall:const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black,),

    bodyLarge:const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black,),
    bodyMedium:const TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black,),
    bodySmall:const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.5)),
    
    labelLarge:const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black,),
    labelMedium:const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black.withOpacity(0.5)),

    
    
    
);

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge:const TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white,),
    headlineMedium:const TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white,),

    titleLarge:const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white,),
    titleMedium:const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white,),
    titleSmall:const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white,),

    bodyLarge:const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white,),
    bodyMedium:const TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.white,),
    bodySmall:const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white.withOpacity(0.5)),
    
    labelLarge:const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.white,),
    labelMedium:const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.white.withOpacity(0.5)),

    
  );
}


// class TTextTheme {
//   TTextTheme._();

//   // Define a constant TextStyle with the desired inherit property
//   static const TextStyle _commonTextStyle = TextStyle(inherit: false);

//   static TextTheme lightTextTheme = TextTheme(
//     // Apply the common TextStyle to all TextStyles in the light theme
//     headlineLarge: _commonTextStyle.copyWith(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
//     headlineMedium: _commonTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
//     titleLarge: _commonTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
//     titleMedium: _commonTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
//     titleSmall: _commonTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
//     bodyLarge: _commonTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
//     bodyMedium: _commonTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
//     bodySmall: _commonTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.5)),
//     labelLarge: _commonTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
//     labelMedium: _commonTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.5)),
//   );

//   static TextTheme darkTextTheme = TextTheme(
//     // Apply the common TextStyle to all TextStyles in the dark theme
//     headlineLarge: _commonTextStyle.copyWith(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
//     headlineMedium: _commonTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
//     titleLarge: _commonTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
//     titleMedium: _commonTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
//     titleSmall: _commonTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
//     bodyLarge: _commonTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
//     bodyMedium: _commonTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
//     bodySmall: _commonTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.5)),
//     labelLarge: _commonTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white),
//     labelMedium: _commonTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.5)),
//   );
// }
