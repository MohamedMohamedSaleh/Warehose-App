part of 'add_product_bloc.dart';

class AddProductEvents {}

class AddProductEvent extends AddProductEvents {
  final bool isTextfield;

  AddProductEvent({required this.isTextfield});
}
