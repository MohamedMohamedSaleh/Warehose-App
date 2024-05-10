part of 'orders_bloc.dart';

abstract class OrdersStates {}

final class OrdersInitial extends OrdersStates {}

final class GetOrdersSuccess extends OrdersStates {}

final class GetOrdersLoading extends OrdersStates {}

final class GetOrdersFailed extends OrdersStates {}
