import 'package:flutter/material.dart';

class MyTheme {

  // define the colors for theme
  static const Color darkBlue = Color(0xFF2d2e32);
    static const Color white = Color(0xFFf8f8f8);
  static const Color gray = Color(0xFF354152);
  static const Color lightBlue = Color(0xFF5d9cec );
  static const Color red = Color(0xFFF73645);



  static ThemeData theme = ThemeData(
      useMaterial3: true,

    // app bar theme
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: lightBlue,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 20, color: white),
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          elevation: 0
      ),
      // set the scaffold background color with the color white
      scaffoldBackgroundColor: darkBlue,
      // set the primary color with the color lightPurple
      primaryColor: lightBlue,
      // set the accent color
      secondaryHeaderColor: white,
      // set the text styles
      textTheme: const TextTheme(
          titleLarge: TextStyle(color: white),
          titleMedium: TextStyle(color: white),
          titleSmall: TextStyle(color: white),
          labelLarge: TextStyle(color: white),
          labelMedium: TextStyle(color: white),
          labelSmall: TextStyle(color: white),
          bodyLarge: TextStyle(color: white),
          bodyMedium: TextStyle(color: white),
          bodySmall: TextStyle(color: white)),
      // set the color of the progress indicator
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: white,
      ),

      // set the elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              backgroundColor: MaterialStateProperty.all(lightBlue),
              foregroundColor: MaterialStateProperty.all(white),
              elevation: MaterialStateProperty.all(0),
              textStyle: MaterialStateProperty.all(const TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 16, color: white)))),
      // set the dialog background color
      dialogTheme: const DialogTheme(
        backgroundColor: darkBlue,
      ),

      // set the text from filed decoration
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: const TextStyle(color: red, fontSize: 12),
        contentPadding: const EdgeInsets.all(15),
        iconColor: lightBlue,
        hintStyle: const TextStyle(color: lightBlue, fontSize: 16),
        prefixIconColor: lightBlue,
        suffixIconColor: lightBlue,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2,
              color: lightBlue,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2,
            color: lightBlue,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2,
              color: lightBlue,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.red,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.red,
            )),
      ),
      dividerTheme:const DividerThemeData( color: lightBlue ),
      // set text button theme
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              foregroundColor:MaterialStateProperty.all(lightBlue) ,
              textStyle: MaterialStateProperty.all(const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: lightBlue)))),
      // set modal bottom sheet style
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: darkBlue,
          shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
          ),
          modalBarrierColor: darkBlue.withOpacity(0.5)
      ),

      datePickerTheme: DatePickerThemeData(
        surfaceTintColor: lightBlue,
        backgroundColor: darkBlue,
        todayBackgroundColor: MaterialStateProperty.all(darkBlue),
        dividerColor: lightBlue,
        cancelButtonStyle: ButtonStyle(foregroundColor: MaterialStateProperty.all(lightBlue)),
        confirmButtonStyle: ButtonStyle(foregroundColor: MaterialStateProperty.all(lightBlue)),
        dayForegroundColor: MaterialStateProperty.all(lightBlue),
        inputDecorationTheme:InputDecorationTheme(
          labelStyle:const TextStyle(color: lightBlue, fontSize: 12),
          focusColor: white.withOpacity(0.5),
          helperStyle: const TextStyle(color: lightBlue, fontSize: 12),
          errorStyle: const TextStyle(color: red, fontSize: 12),
          iconColor: lightBlue,
          contentPadding: const EdgeInsets.all(15),
          hintStyle: const TextStyle(color: white, fontSize: 16),
          prefixIconColor: lightBlue,
          suffixIconColor: lightBlue,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 2,
                color: lightBlue,
              )),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2,
              color: lightBlue,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 2,
                color: lightBlue,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.red,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.red,
              )),
        ),
        weekdayStyle:const TextStyle(color: lightBlue),
        yearForegroundColor: MaterialStateProperty.all(lightBlue),
        yearStyle: const TextStyle(color: lightBlue),
        headerHeadlineStyle:const TextStyle(color: lightBlue) ,
        headerHelpStyle: const TextStyle(color: lightBlue),
        headerBackgroundColor: darkBlue,
        headerForegroundColor: lightBlue,
        rangePickerBackgroundColor: darkBlue,
      ),
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              color: darkBlue,
              fontSize: 12,
            )
        ),
      ),
      bottomNavigationBarTheme:const BottomNavigationBarThemeData(
          backgroundColor: lightBlue,
          selectedIconTheme: IconThemeData(color: darkBlue),
          unselectedIconTheme:IconThemeData(color: darkBlue) ,
          showUnselectedLabels: false,
          showSelectedLabels: false
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: lightBlue,
          foregroundColor: darkBlue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          )
      )  );

}
