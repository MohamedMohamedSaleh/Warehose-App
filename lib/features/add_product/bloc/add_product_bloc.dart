import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/core/logic/cache_helper.dart';

import '../../../../core/logic/dio_helper.dart';
import '../../../../core/logic/helper_mothods.dart';
import '../models/qr_code_model.dart';

part 'add_product_state.dart';
part 'add_product_events.dart';

class AddProductBloc extends Bloc<AddProductEvents, AddProductStates> {
  AddProductBloc() : super(AddProductStates()) {
    on<AddProductEvent>(_addProduct);
  }

  late Map<String, dynamic> jsonData;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // Barcode? result;
  // QRViewController? controller;
  late ProductData model;
  final idUser = CacheHelper.getUserId();
  final tokenUser = CacheHelper.getUserToken();
  bool isScaned = false;

  String? category;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController longController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
    Future<void> _addProduct(
      AddProductEvent event, Emitter<AddProductStates> emit) async {
    emit(AddProductLoadingState());

    final response = await DioHelper.sendData(
      endPoint: 'MP_AddProducts',
      data: {
        'token': tokenUser,
        'userid': idUser,
        'ProductID': idController.text ,
        'Name':  nameController.text ,
        'Description':
             descriptionController.text,
        'Category':  category ,
        'Weight':  weightController.text,
        'Dimensions': 
             "[${longController.text},${widthController.text},${heightController.text}]",
      },
    );
    if (response.isSuccess) {
      showMessage(message: response.message, type: MessageType.success);
      if (event.isTextfield) {
        idController.clear();
        nameController.clear();
        descriptionController.clear();
        categoryController.clear();
        weightController.clear();
        category = null;
        longController.clear();
        heightController.clear();
        widthController.clear();
      }

      emit(AddProductSuccessState());
    } else {
      emit(AddProductFailedState());
      showMessage(
        message: response.message,
      );
    }
    isScaned = false;
    // result = null;
    Navigator.pop(navigatorKey.currentContext!);
  }

  // Future<void> _addProduct(
  //     AddProductEvent event, Emitter<AddProductStates> emit) async {
  //   emit(AddProductLoadingState());

  //   final response = await DioHelper.sendData(
  //     endPoint: 'MP_AddProducts',
  //     data: {
  //       'token': tokenUser,
  //       'userid': idUser,
  //       'ProductID': event.isTextfield ? idController.text : model.id,
  //       'Name': event.isTextfield ? nameController.text : model.name,
  //       'Description':
  //           event.isTextfield ? descriptionController.text : model.description,
  //       'Category': event.isTextfield ? category : model.category,
  //       'Weight': event.isTextfield ? weightController.text : model.weight,
  //       'Dimensions': event.isTextfield
  //           ? "[${longController.text},${widthController.text},${heightController.text}]"
  //           : model.dimensions,
  //     },
  //   );
  //   if (response.isSuccess) {
  //     showMessage(message: response.message, type: MessageType.success);
  //     if (event.isTextfield) {
  //       idController.clear();
  //       nameController.clear();
  //       descriptionController.clear();
  //       categoryController.clear();
  //       weightController.clear();
  //       category = null;
  //       longController.clear();
  //       heightController.clear();
  //       widthController.clear();
  //     }

  //     emit(AddProductSuccessState());
  //   } else {
  //     emit(AddProductFailedState());
  //     showMessage(
  //       message: response.message,
  //     );
  //   }
  //   isScaned = false;
  //   result = null;
  //   Navigator.pop(navigatorKey.currentContext!);
  // }
}
