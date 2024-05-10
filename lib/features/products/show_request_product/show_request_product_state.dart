part of 'show_request_product_bloc.dart';

abstract class ShowRequestProductStates {}

final class ShowRequestProductInitial extends ShowRequestProductStates {}

class RequestProductLoadingState extends ShowRequestProductStates {
  final String id;

  RequestProductLoadingState({required this.id});
}

class RequestProductFailedState extends ShowRequestProductStates {}

class RequestProductSuccessState extends ShowRequestProductStates {}

class ShowProductLoadingState extends ShowRequestProductStates {}

class ShowProductFailedState extends ShowRequestProductStates {}

class ShowProductSuccessState extends ShowRequestProductStates {}
