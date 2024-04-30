import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/constants/my_colors.dart';
import 'package:warehouse/core/widgets/app_image.dart';
import 'package:warehouse/core/widgets/custom_app_bar.dart';
import 'package:warehouse/features/notiffications/cubit/notifications_cubit.dart';
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
              const EdgeInsets.only(top: 22, bottom: 15, left: 16, right: 24),
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
      padding: const EdgeInsets.only(
        bottom: 28,
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
          borderRadius: BorderRadius.circular(11),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color(0xff4C8613).withAlpha(13)),
                child: const Padding(
                  padding: EdgeInsets.all(6),
                  child: AppImage(
                    'assets/images/svg/my_orders.svg',
                    color: mainColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
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
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        CustomIcon(
                          isBack: false,
                          height: 24,
                          width: 24,
                          color: const Color(0xffFF0000).withOpacity(.1),
                          onTap: () {
                            bloc.deleteNoti(index: widget.index);
                          },
                          child: BlocBuilder(
                            bloc: bloc,
                            builder: (context, state) {
                              if (state is DeleteNotificationLoadingsState &&
                                  state.index == widget.index) {
                                return const Center(
                                  child: SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                    ),
                                  ),
                                );
                              }
                              return const AppImage(
                                  'assets/images/svg/Trash.svg');
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      widget.model.body,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff989898),
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
