import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/core/logic/cache_helper.dart';

part 'themes_event.dart';

class ThemesBloc extends Bloc<ThemesEvent, ThemeMode> {
  ThemesBloc()
      : super(CacheHelper.getIsDark() == true
            ? ThemeMode.dark
            : ThemeMode.light) {
    on<ChangeThemesEvent>((event, emit) {
      event.isDark ? emit(ThemeMode.dark) : emit(ThemeMode.light);

      CacheHelper.setIsDark(isDark: event.isDark);
    });
  }
}
