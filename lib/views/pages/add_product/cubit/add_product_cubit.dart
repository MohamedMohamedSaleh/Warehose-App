import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../core/logic/dio_helper.dart';
import '../../../../core/logic/helper_mothods.dart';
import '../../../../main.dart';
import '../models/qr_code_model.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit() : super(AddProductStates());

  late Map<String, dynamic> jsonData;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  late ProductData model;
  final idUser = prefs.getInt('id');
  final tokenUser = prefs.getString('token');
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

  void addProduct({required bool isTextfield}) async {
    emit(AddProductLoadingState());

    final response = await DioHelper().sendData(
      endPoint: 'MP_AddProducts',
      data: {
        'token': tokenUser,
        'userid': idUser,
        'ProductID': isTextfield ? idController.text : model.id,
        'Name': isTextfield ? nameController.text : model.name,
        'Description':
            isTextfield ? descriptionController.text : model.description,
        'Category': isTextfield ? category : model.category,
        'Weight': isTextfield ? weightController.text : model.weight,
        'Dimensions': isTextfield
            ? "[${longController.text},${widthController.text},${heightController.text}]"
            : model.dimensions,
      },
    );
    if (response.isSuccess) {
      showMessage(message: response.message, type: MessageType.success);
      if (isTextfield) {
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
  }
}
