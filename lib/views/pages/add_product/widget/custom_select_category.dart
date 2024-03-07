import 'package:flutter/material.dart';
import 'package:warehouse/features/add_product/bloc/add_product_bloc.dart';

import '../../../sheets/category_sheet.dart';
import '../../widgets/custom_textfield_pages.dart';

class CustomSelectCategory extends StatefulWidget {
  const CustomSelectCategory({super.key, required this.bloc});
  final AddProductBloc bloc;
  
  @override
  State<CustomSelectCategory> createState() => _CustomSelectCategoryState();
}

class _CustomSelectCategoryState extends State<CustomSelectCategory> {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () async {
              if (!context.mounted) return;
              FocusScope.of(context).unfocus();
              widget.bloc.category = await showModalBottomSheet(
                context: context,
                builder: (context) => const CategorySheet(),
              );
              if ( widget.bloc.category != null) {
                setState(() {});
              }
            },
            child: AbsorbPointer(
              absorbing: true,
              child: CustomTextFieldWithTitle(
                isText: true,
                titelText: "Categoty",
                validator: (value) {
                  if ( widget.bloc.category?.isEmpty ?? true) {
                    return "field is required!";
                  } else {
                    return null;
                  }
                },
                isCategory: true,
                labelText:  widget.bloc.category ?? "product type",
                controller:  widget.bloc.categoryController,
              ),
            ),
          ),
        ),
        ( widget.bloc.category != null)
            ? IconButton(
                onPressed: () {
                   widget.bloc.category = null;
                  setState(() {});
                },
                icon: const Icon(
                  Icons.clear,
                  color: Colors.red,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
