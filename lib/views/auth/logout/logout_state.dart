part of 'logout_bloc.dart';

@immutable
sealed class LogoutStates {}

final class LogoutInitial extends LogoutStates {}
final class LogoutSuccess extends LogoutStates {}
final class LogoutLoading extends LogoutStates {}
final class LogoutFailed extends LogoutStates {}
