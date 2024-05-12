import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse/constants/my_colors.dart';
import 'package:warehouse/features/orders/model.dart';

class CustomItemOrder extends StatefulWidget {
  const CustomItemOrder({super.key, required this.model});
  final Orders model;

  @override
  State<CustomItemOrder> createState() => _CustomItemOrderState();
}

class _CustomItemOrderState extends State<CustomItemOrder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4, left: 4, bottom: 10).r,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 11, color: Colors.black.withOpacity(0.04)),
            ],
            borderRadius: BorderRadius.circular(11)),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            childrenPadding: EdgeInsets.symmetric(horizontal: 16.w),
            tilePadding: EdgeInsets.symmetric(horizontal: 16.w),
            title: Row(
              children: [
                Text(
                  //TODO: orderid
                  'ID: ${widget.model.orderID}',
                  style: _textStyle1,
                ),
                const Spacer(),
                DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      color: widget.model.orderStatus == 'processing'
                          ? mainColor.withOpacity(.2)
                          : widget.model.orderStatus == 'success'
                              ? Colors.green.withOpacity(.2)
                              : Colors.red.withOpacity(.8)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                    //TODO: STATUS
                    child: Text(
                      widget.model.orderStatus,
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                  ),
                ),
              ],
            ),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Product:', style: _textStyle1),
                      SizedBox(
                        width: 130.w,
                        child: Text(
                          ' ${widget.model.name}',
                          style:
                              _textStyle1.copyWith(fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      Text('Id:', style: _textStyle1),
                      Text(
                        ' ${widget.model.productID}',
                        style:
                            _textStyle1.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      Text('Robot: ', style: _textStyle1),
                      Text(widget.model.robotID,
                          style: _textStyle1.copyWith(
                              fontWeight: FontWeight.w500)),
                      const Spacer(),
                      Text('Type: ', style: _textStyle1),
                      Text(widget.model.type,
                          style: _textStyle1.copyWith(
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Time: ', style: _textStyle1),
                      Text(widget.model.time,
                          style: _textStyle1.copyWith(
                              fontWeight: FontWeight.w500)),
                      const Spacer(),
                      Text('Cell: ', style: _textStyle1),
                      Text(widget.model.cellID,
                          style: _textStyle1.copyWith(
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle _textStyle1 =
    TextStyle(color: mainColor, fontSize: 16.sp, fontWeight: FontWeight.bold);
