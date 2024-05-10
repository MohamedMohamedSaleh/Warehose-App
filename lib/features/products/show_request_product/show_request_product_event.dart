part of 'show_request_product_bloc.dart';

abstract class ShowRequestProductEvents {}

final class ShowProductEvent extends ShowRequestProductEvents {
  final bool isLoading;

  ShowProductEvent({required this.isLoading});
}

final class RequestProductEvent extends ShowRequestProductEvents {
  final String id;

  RequestProductEvent({required this.id});
}
