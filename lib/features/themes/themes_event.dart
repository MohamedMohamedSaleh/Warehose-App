part of 'themes_bloc.dart';

@immutable
sealed class ThemesEvent {}

final class ChangeThemesEvent extends ThemesEvent {
  final bool isDark;

  ChangeThemesEvent({required this.isDark});
}
