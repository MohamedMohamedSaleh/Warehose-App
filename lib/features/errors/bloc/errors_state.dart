part of 'errors_bloc.dart';

sealed class ErrorsStates {}

final class ErrorsInitial extends ErrorsStates {}

final class GetErrrorsLoading extends ErrorsStates {}

final class GetErrrorsSuccess extends ErrorsStates {}

final class GetErrrorsFailed extends ErrorsStates {}

final class FixErrrorsLoading extends ErrorsStates {
  final String id;

  FixErrrorsLoading({required this.id});
}

final class FixErrrorsSuccess extends ErrorsStates {}

final class FixErrrorsFailed extends ErrorsStates {}
