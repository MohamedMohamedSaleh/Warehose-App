import 'package:flutter/material.dart';
import 'package:warehouse/views/pages/add_product/cubit/add_product_cubit.dart';

import '../../../sheets/category_sheet.dart';
import '../../widgets/custom_textfield_pages.dart';

class CustomSelectCategory extends StatefulWidget {
  const CustomSelectCategory({super.key, required this.cubit});
  final AddProductCubit cubit;
  
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
              widget.cubit.category = await showModalBottomSheet(
                context: context,
                builder: (context) => const CategorySheet(),
              );
              if ( widget.cubit.category != null) {
                setState(() {});
              }
            },
            child: AbsorbPointer(
              absorbing: true,
              child: CustomTextFieldWithTitle(
                isText: true,
                titelText: "Categoty",
                validator: (value) {
                  if ( widget.cubit.category?.isEmpty ?? true) {
                    return "field is required!";
                  } else {
                    return null;
                  }
                },
                isCategory: true,
                labelText:  widget.cubit.category ?? "product type",
                controller:  widget.cubit.categoryController,
              ),
            ),
          ),
        ),
        ( widget.cubit.category != null)
            ? IconButton(
                onPressed: () {
                   widget.cubit.category = null;
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
