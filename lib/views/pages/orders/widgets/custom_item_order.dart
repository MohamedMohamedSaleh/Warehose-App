import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
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
                  'ID: ${widget.model.orderID}',
                  style: TextStyle(
                      color:
                          Theme.of(navigatorKey.currentContext!).primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      color: widget.model.orderStatus == 'processing'
                          ? Theme.of(context).primaryColor.withOpacity(.2)
                          : widget.model.orderStatus == 'success'
                              ? Colors.green.withOpacity(.2)
                              : Colors.red.withOpacity(.8)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
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
                      Text('Product:',
                          style: TextStyle(
                              color: Theme.of(navigatorKey.currentContext!)
                                  .primaryColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 130.w,
                        child: Text(
                          ' ${widget.model.name * 2}',
                          style: TextStyle(
                              color: Theme.of(navigatorKey.currentContext!)
                                  .primaryColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Id:',
                        style: TextStyle(
                            color: Theme.of(navigatorKey.currentContext!)
                                .primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' ${widget.model.productID}',
                        style: TextStyle(
                            color: Theme.of(navigatorKey.currentContext!)
                                .primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      Text('Robot: ',
                          style: TextStyle(
                              color: Theme.of(navigatorKey.currentContext!)
                                  .primaryColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold)),
                      Text(
                        widget.model.robotID,
                        style: TextStyle(
                            color: Theme.of(navigatorKey.currentContext!)
                                .primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Text(
                        'Type: ',
                        style: TextStyle(
                            color: Theme.of(navigatorKey.currentContext!)
                                .primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.model.type,
                        style: TextStyle(
                            color: Theme.of(navigatorKey.currentContext!)
                                .primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Time: ',
                        style: TextStyle(
                            color: Theme.of(navigatorKey.currentContext!)
                                .primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.model.time,
                        style: TextStyle(
                            color: Theme.of(navigatorKey.currentContext!)
                                .primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Text('Cell: ',
                          style: TextStyle(
                              color: Theme.of(navigatorKey.currentContext!)
                                  .primaryColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold)),
                      Text(
                        widget.model.cellID,
                        style: TextStyle(
                            color: Theme.of(navigatorKey.currentContext!)
                                .primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
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
