import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart'; // 316
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/core/widgets/custom_filled_button.dart';
import 'package:warehouse/views/pages/add_product/cubit/add_product_cubit.dart';
import 'package:warehouse/views/pages/add_product/widget/custom_app_bar.dart';
import 'package:warehouse/views/pages/add_product/widget/custom_select_category.dart';
import '../widgets/custom_textfield_pages.dart';

class FormAddProduct extends StatefulWidget {
  const FormAddProduct({super.key});

  @override
  State<FormAddProduct> createState() => _FormAddProductState();
}

class _FormAddProductState extends State<FormAddProduct> {
  late AddProductCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ZoomIn(
        duration: const Duration(milliseconds: 500),
        child: Scaffold(
          // backgroundColor: Colors.white,
          appBar: const CustomAppBarAddProduct(),
          body: Form(
            key: cubit.formKey,
            autovalidateMode: cubit.autovalidateMode,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              children: [
                CustomTextFieldWithTitle(
                  titelText: "Name",
                  labelText: "product name",
                  controller: cubit.nameController,
                ),
                CustomTextFieldWithTitle(
                  titelText: "Description",
                  labelText: "product description",
                  maxLins: 3,
                  controller: cubit.descriptionController,
                ),
                CustomTextFieldWithTitle(
                  titelText: "ID",
                  labelText: "product Id",
                  controller: cubit.idController,
                ),
                CustomTextFieldWithTitle(
                  titelText: "Weight",
                  labelText: "product weight",
                  controller: cubit.weightController,
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
                        controller: cubit.longController,
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
                        controller: cubit.widthController,
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
                        controller: cubit.heightController,
                      ),
                    ),
                  ],
                ),
                BlocBuilder<AddProductCubit, AddProductStates>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        CustomSelectCategory(cubit: cubit),
                        const SizedBox(
                          height: 18,
                        ),
                        state is AddProductLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : SizedBox(
                              width: double.infinity,
                              child: CustomFilledButton(
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    ScaffoldMessenger.of(context)
                                        .removeCurrentSnackBar();
                                    if (cubit.formKey.currentState!.validate()) {
                                      cubit.addProduct(isTextfield: true);
                                      cubit.autovalidateMode =
                                          AutovalidateMode.disabled;
                                      setState(() {});
                                    } else {
                                      cubit.autovalidateMode =
                                          AutovalidateMode.onUserInteraction;
                                      setState(() {});
                                    }
                                  },
                                  title: "Add Product",
                                ),
                            ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
