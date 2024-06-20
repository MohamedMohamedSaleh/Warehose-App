part of 'monitoring_bloc.dart';

sealed class MonitoringStates {}

final class MonitoringInitial extends MonitoringStates {}

final class GetMonitoringLoading extends MonitoringStates {}

final class GetMonitoringSuccess extends MonitoringStates {
  final MonitoringData model;

  GetMonitoringSuccess({required this.model});
}

final class GetMonitoringFailed extends MonitoringStates {}
