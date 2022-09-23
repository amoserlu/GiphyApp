import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit()
      : super(SchedulerBinding.instance.window.platformBrightness ==
                Brightness.dark
            ? _darkTheme
            : _lightTheme);

  static final _lightTheme = ThemeData(
      useMaterial3: true,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xffe6ffff),
        foregroundColor: Colors.black,
      ),
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      primaryColor: const Color(0xffa5d6a7),
      cardColor: const Color(0xffd7ffd9),
      scaffoldBackgroundColor: const Color(0xffb3e5fc),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xffd7ffd9))
      
      
      );

  static final _darkTheme = ThemeData(
      useMaterial3: true,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xffe6ffff),
        foregroundColor: Colors.black,
      ),
      brightness: Brightness.dark,
      fontFamily: 'Poppins',
      inputDecorationTheme: const InputDecorationTheme(
      hoverColor: Colors.white,
    ),
      primarySwatch: Colors.lime,
      primaryColor: const Color(0xff000a12),
      cardColor: const Color(0xff000a12),
      scaffoldBackgroundColor: const Color(0xff4f5b62),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff000a12))
      
      );

  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
