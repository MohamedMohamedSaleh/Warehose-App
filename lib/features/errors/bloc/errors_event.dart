part of 'errors_bloc.dart';

sealed class ErrorsEvents {}

final class GetErrorsEvent extends ErrorsEvents {
  final bool isLoading;

  GetErrorsEvent({required this.isLoading});
}

final class FixErrorsEvent extends ErrorsEvents {
  final String id;

  FixErrorsEvent({required this.id});
}
