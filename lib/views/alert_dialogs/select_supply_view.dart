import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/constants/my_colors.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/features/select_supply/select_supply_cubit.dart';

class SelectSupplyView extends StatelessWidget {
  const SelectSupplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showMessage(
            message: "select supplier cell is required!",
            type: MessageType.faild);
        return false;
      },
      child: BlocProvider(
        create: (context) => SelectSupplyCubit(),
        child: Builder(builder: (context) {
          final cubit = SelectSupplyCubit.get(context);
          return ZoomIn(
            duration: const Duration(milliseconds: 500),
            child: AlertDialog(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              titlePadding: const EdgeInsets.symmetric(horizontal: 16),
              title: const Padding(
                padding: EdgeInsets.only(top: 16, right: 16, bottom: 5),
                child: Row(
                  children: [
                    Text(
                      "Select Supplier Cell",
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Icon(
                      Icons.check_box,
                      color: mainColor,
                      size: 24,
                    ),
                  ],
                ),
              ),
              content: BlocBuilder<SelectSupplyCubit, SelectSupplyStates>(
                builder: (context, state) {
                  return SizedBox(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              side: BorderSide(color: mainColor.withOpacity(.3)),
                              activeColor: mainColor,
                              value: cubit.isSupp1,
                              onChanged: (value) {
                                cubit.toSupp1();
                              },
                            ),
                            InkWell(
                              onTap: () {
                                cubit.isSupp1 = true;
                              },
                              child: const Text(
                                'Supply 1',
                                style: TextStyle(
                                    color: mainColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              side: BorderSide(color: mainColor.withOpacity(.3)),
                              value: !cubit.isSupp1,
                              onChanged: (value) {
                                cubit.toSupp2();
                              },
                              activeColor: mainColor,
                              hoverColor: mainColor,
                            ),
                            InkWell(
                              onTap: () {
                                cubit.isSupp1 = false;
                              },
                              child: const Text(
                                'Supply 2',
                                style: TextStyle(
                                    color: mainColor,
                                    fontSize: 15,
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
              actionsPadding: const EdgeInsets.only(top: 10, bottom: 16),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                // Center(child: CircularProgressIndicator(),),
                BlocBuilder<SelectSupplyCubit, SelectSupplyStates>(
                  builder: (context, state) {
                    if (state is SelectSupplyLoadState) {
                      return const Center(
                        child: SizedBox(height: 35, width: 35, child: CircularProgressIndicator()),
                      );
                    } else {
                      return SizedBox(
                        height: 35,
                        width: 100,
                        child: FilledButton(
                          onPressed: () {
                            cubit.selectSupply(
                                supid: cubit.isSupp1 ? "1" : "2");
                          },
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
