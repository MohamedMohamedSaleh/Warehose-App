import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorySheet extends StatefulWidget {
  const CategorySheet({super.key});

  @override
  State<CategorySheet> createState() => _CategorySheetState();
}

class _CategorySheetState extends State<CategorySheet> {
  List types = [
    "Electronics",
    "Automotive",
    "Home Decor",
    "Clothing",
    "Sprots",
    "Books",
    "Toys and Games",
    "Kitchen and Dining",
    "Health and Wellness",
    "Another",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "choose type of product",
            style: TextStyle(
                color: Theme.of(context).primaryColor, fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => _Item(
                type: types[index],
              ),
              itemCount: types.length,
            ),
          )
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: InkWell(
        onTap: () {
          Navigator.pop(context, type);
        },
        child: Container(
          height: 40.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15).w,
            color: Theme.of(context).primaryColor.withOpacity(.4),
          ),
          child: Text(
            type,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
