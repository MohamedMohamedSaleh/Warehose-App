import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/constants/my_colors.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/features/select_supply/select_supply_bloc.dart';

class SelectSupplyView extends StatefulWidget {
  const SelectSupplyView(
      {super.key, this.isLogin = true, this.title = 'Continue'});
  final bool isLogin;
  final String title;

  @override
  State<SelectSupplyView> createState() => _SelectSupplyViewState();
}

class _SelectSupplyViewState extends State<SelectSupplyView> {
  final bloc = KiwiContainer().resolve<SelectSupplyBloc>();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          if (widget.isLogin) {
            showMessage(
              message: "select supplier cell is required!",
              type: MessageType.faild,
            );
          } else {
            Navigator.pop(context);
          }
        }
      },
      child: ZoomIn(
        duration: const Duration(milliseconds: 500),
        child: AlertDialog(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15).w),
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          titlePadding: EdgeInsets.symmetric(horizontal: 16.w),
          title: Padding(
            padding: EdgeInsets.only(top: 16.h, right: 16.w, bottom: 5.h),
            child: Row(
              children: [
                Text(
                  "Select Supplier Cell",
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 14.w,
                ),
                const Icon(
                  Icons.check_box,
                  color: mainColor,
                  size: 24,
                ),
              ],
            ),
          ),
          content: BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              return SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          visualDensity: const VisualDensity(
                            // horizontal: -4,
                            vertical: -2,
                          ),
                          checkColor: Colors.white,
                          side: BorderSide(color: mainColor.withOpacity(.3)),
                          activeColor: mainColor,
                          value: bloc.isSupp1,
                          onChanged: (value) {
                            bloc.add(SelectSupp1Event());
                          },
                        ),
                        InkWell(
                          onTap: () {
                            bloc.add(SelectSupp1Event());
                          },
                          child: Text(
                            'Supply 1',
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          visualDensity: const VisualDensity(
                            // horizontal: -4,
                            vertical: -2,
                          ),
                          checkColor: Colors.white,
                          side: BorderSide(color: mainColor.withOpacity(.3)),
                          value: !bloc.isSupp1,
                          onChanged: (value) {
                            bloc.add(SelectSupp2Event());
                          },
                          activeColor: mainColor,
                          hoverColor: mainColor,
                        ),
                        InkWell(
                          onTap: () {
                            bloc.add(SelectSupp2Event());
                          },
                          child: Text(
                            'Supply 2',
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          actionsPadding: const EdgeInsets.only(top: 5, bottom: 16).h,
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            // Center(child: CircularProgressIndicator(),),
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is SelectSupplyLoadState) {
                  return Center(
                    child: SizedBox(
                        height: 35.w,
                        width: 35.w,
                        child: const CircularProgressIndicator()),
                  );
                } else {
                  return SizedBox(
                    height: 35.w,
                    width: 110.w,
                    child: FilledButton(
                      onPressed: () {
                        bloc.add(SelectSupplyEvent(
                            supid: bloc.isSupp1 ? '1' : '2',
                            isLogin: widget.isLogin));
                      },
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
