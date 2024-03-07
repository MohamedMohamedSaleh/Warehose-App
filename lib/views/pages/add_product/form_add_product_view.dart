import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart'; // 316
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/core/widgets/custom_app_bar.dart';
import 'package:warehouse/core/widgets/custom_filled_button.dart';
import 'package:warehouse/features/add_product/bloc/add_product_bloc.dart';
import 'package:warehouse/views/pages/add_product/widget/custom_select_category.dart';
import '../widgets/custom_textfield_pages.dart';

class FormAddProduct extends StatefulWidget {
  const FormAddProduct({super.key});

  @override
  State<FormAddProduct> createState() => _FormAddProductState();
}

class _FormAddProductState extends State<FormAddProduct> {
  final bloc = KiwiContainer().resolve<AddProductBloc>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ZoomIn(
        duration: const Duration(milliseconds: 500),
        child: Scaffold(
          appBar: const CustomAppBar(
            title: 'Add Product',
          ),
          body: Form(
            key: bloc.formKey,
            autovalidateMode: bloc.autovalidateMode,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              children: [
                CustomTextFieldWithTitle(
                  titelText: "Name",
                  labelText: "product name",
                  controller: bloc.nameController,
                ),
                CustomTextFieldWithTitle(
                  titelText: "Description",
                  labelText: "product description",
                  maxLins: 3,
                  controller: bloc.descriptionController,
                ),
                CustomTextFieldWithTitle(
                  titelText: "ID",
                  labelText: "product Id",
                  controller: bloc.idController,
                ),
                CustomTextFieldWithTitle(
                  isWeight: true,
                  titelText: "Weight",
                  labelText: "product weight",
                  controller: bloc.weightController,
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
                        controller: bloc.longController,
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
                        controller: bloc.widthController,
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
                        controller: bloc.heightController,
                      ),
                    ),
                  ],
                ),
                BlocBuilder(
                  bloc: bloc,
                  builder: (context, state) {
                    return Column(
                      children: [
                        CustomSelectCategory(bloc: bloc),
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
                                    if (bloc.formKey.currentState!
                                        .validate()) {
                                      bloc.add(AddProductEvent(isTextfield: true));
                                      bloc.autovalidateMode =
                                          AutovalidateMode.disabled;
                                      setState(() {});
                                    } else {
                                      bloc.autovalidateMode =
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
