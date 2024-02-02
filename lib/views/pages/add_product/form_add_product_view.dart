import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart'; // 316
import 'package:warehouse/core/logic/dio_helper.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/core/widgets/custom_filled_button.dart';
import 'package:warehouse/main.dart';
import 'package:warehouse/views/pages/add_product/widget/custom_app_bar.dart';
import 'package:warehouse/views/sheets/category_sheet.dart';
import '../widgets/custom_textfield_pages.dart';

class FormAddProduct extends StatefulWidget {
  const FormAddProduct({super.key});

  @override
  State<FormAddProduct> createState() => _FormAddProductState();
}

class _FormAddProductState extends State<FormAddProduct> {
  String? category;
  final idUser = prefs.getInt('id');
  final tokenUser = prefs.getString('token');
  bool isLoading = false;
  void addProduct() async {
    isLoading = true;
    setState(() {});
    DioHelper controller = DioHelper();
    var message = await controller.sendData(
      endPoint: 'MP_AddProducts',
      data: {
        'token': tokenUser,
        'userid': idUser,
        'ProductID': idController.text,
        'Name': nameController.text,
        'Description': descriptionController.text,
        'Category': typeController.text,
        'Weight': weightController.text,
      },
    );
    if (message.isSuccess) {
      showMessage(message: message.message, type: MessageType.success);
      idController.clear();
      nameController.clear();
      descriptionController.clear();
      typeController.clear();
      weightController.clear();
      category = null;
    } else {
      showMessage(
        message: message.message,
      );
    }
    isLoading = false;
    setState(() {});
  }

  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController longController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ZoomIn(
        duration: const Duration(milliseconds: 500),
        child: Scaffold(
          appBar: const CustomAppBarAddProduct(),
          body: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              children: [
                CustomTextFieldWithTitle(
                  titelText: "Name",
                  labelText: "product name",
                  controller: nameController,
                ),
                CustomTextFieldWithTitle(
                  titelText: "Description",
                  labelText: "product description",
                  maxLins: 3,
                  controller: descriptionController,
                ),
                CustomTextFieldWithTitle(
                  titelText: "ID",
                  labelText: "product Id",
                  controller: idController,
                ),
                CustomTextFieldWithTitle(
                  titelText: "Weight",
                  labelText: "product weight",
                  controller: weightController,
                ),
                const Text(
                  "Dimentions",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFieldWithTitle(
                        isText: false,
                        labelText: "long",
                        controller: longController,
                      ),
                    ),
                    const Text(
                      "*",
                      style: TextStyle(fontSize: 30),
                    ),
                    Expanded(
                      child: CustomTextFieldWithTitle(
                        isText: false,
                        labelText: "width",
                        controller: widthController,
                      ),
                    ),
                    const Text(
                      "*",
                      style: TextStyle(fontSize: 30),
                    ),
                    Expanded(
                      child: CustomTextFieldWithTitle(
                        isText: false,
                        labelText: "height",
                        controller: heightController,
                      ),
                    ),
                  ],
                ),
                StatefulBuilder(
                  builder: (context, setState) => Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            if (!context.mounted) return;
                            FocusScope.of(context).unfocus();
                            category = await showModalBottomSheet(
                              context: context,
                              builder: (context) => const CategorySheet(),
                            );
                            if (category != null) {
                              setState(() {});
                            }
                          },
                          child: AbsorbPointer(
                            absorbing: true,
                            child: CustomTextFieldWithTitle(
                              isText: true,
                              titelText: "Categoty",
                              validator: (value) {
                                if (category?.isEmpty ?? true) {
                                  return "field is required!";
                                } else {
                                  return null;
                                }
                              },
                              isCategory: true,
                              labelText: category ?? "product type",
                              controller: typeController,
                            ),
                          ),
                        ),
                      ),
                      (category != null)
                          ? IconButton(
                              onPressed: () {
                                category = null;
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomFilledButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          if (formKey.currentState!.validate()) {
                            addProduct();
                            autovalidateMode = AutovalidateMode.disabled;
                            setState(() {});
                          } else {
                            autovalidateMode = AutovalidateMode.onUserInteraction;
                            setState(() {});
                          }
                        },
                        title: "Add Product",
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
