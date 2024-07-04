import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/core/widgets/app_image.dart';
import 'package:warehouse/core/widgets/custom_app_bar.dart';
import 'package:warehouse/features/notiffications/notifications_cubit.dart';
import 'package:warehouse/views/pages/widgets/custom_icon.dart';

import '../../features/notiffications/model.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  final bloc = KiwiContainer().resolve<NotificationsCubit>()..openedNoti();

  @override
  Widget build(BuildContext context) {
    bloc.openedNoti();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Notifications',
        isAcount: true,
      ),
      body: BlocListener(
        bloc: bloc,
        listener: (context, state) {
          if (state is DeleteNotificationSuccessState ||
              state is GetNotificationSuccessState) {
            setState(() {});
          }
        },
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding:
              const EdgeInsets.only(top: 22, bottom: 15, left: 16, right: 24).r,
          itemBuilder: (context, index) => _Item(
            model: bloc.noti.reversed.toList()[index],
            index: index,
          ),
          itemCount: bloc.noti.length,
        ),
      ),
    );
  }
}

class _Item extends StatefulWidget {
  const _Item({required this.model, required this.index});
  final NotificationData model;
  final int index;

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  final bloc = KiwiContainer().resolve<NotificationsCubit>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 28.h,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 40,
              color: Colors.black.withOpacity(.04),
            ),
          ],
          borderRadius: BorderRadius.circular(11).w,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0).w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 33.w,
                width: 33.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9).w,
                    color: const Color(0xff4C8613).withAlpha(13)),
                child: Padding(
                  padding: const EdgeInsets.all(6).w,
                  child:  AppImage(
                    'assets/images/svg/my_orders.svg',
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 16,
                          fit: FlexFit.tight,
                          child: Text(
                            widget.model.title,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        BlocBuilder(
                          bloc: bloc,
                          builder: (context, state) {
                            return CustomIcon(
                              isBack: false,
                              height: 24.w,
                              width: 24.w,
                              color: const Color(0xffFF0000).withOpacity(.1),
                              onTap: () async {
                                if (state is! DeleteNotificationLoadingsState) {
                                  await bloc.deleteNoti(
                                      index:
                                          bloc.noti.length - widget.index - 1);
                                }
                              },
                              child: BlocBuilder(
                                bloc: bloc,
                                builder: (context, state) {
                                  if (state
                                          is DeleteNotificationLoadingsState &&
                                      state.index ==
                                          bloc.noti.length - widget.index - 1) {
                                    return Center(
                                      child: SizedBox(
                                        height: 16.w,
                                        width: 16.w,
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 2.5,
                                        ),
                                      ),
                                    );
                                  }
                                  return const AppImage(
                                      'assets/images/svg/Trash.svg');
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      widget.model.body,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff989898),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
