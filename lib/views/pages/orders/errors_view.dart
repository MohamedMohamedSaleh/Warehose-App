import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/constants/my_colors.dart';
import 'package:warehouse/core/widgets/custom_app_bar.dart';
import 'package:warehouse/features/errors/bloc/errors_bloc.dart';

import '../../../features/errors/errors_model.dart';

class ErrorsView extends StatefulWidget {
  const ErrorsView({super.key});

  @override
  State<ErrorsView> createState() => _ErrorsViewState();
}

class _ErrorsViewState extends State<ErrorsView> {
  final bloc = KiwiContainer().resolve<ErrorsBloc>()..add(GetErrorsEvent(isLoading: true));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Errors"),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetErrrorsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
              itemCount: bloc.list.length,
              itemBuilder: (context, index) => CustomItemError(
                bloc: bloc,
                model: bloc.list[index],
              ),
            );
          }
        },
      ),
    );
  }
}

class CustomItemError extends StatefulWidget {
  const CustomItemError({super.key, required this.model, required this.bloc});
  final ErrorsBloc bloc;
  final ErrorModel model;
  @override
  State<CustomItemError> createState() => _CustomItemErrorState();
}

class _CustomItemErrorState extends State<CustomItemError> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(
          color: mainColor.withOpacity(.2),
        ),
        boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.02))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.model.type == '0'
                      ? 'Location Error'
                      : 'Robot(${widget.model.robotId}) Error',
                  style: const TextStyle(
                      color: mainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  "#${widget.model.errorId}",
                  style: const TextStyle(
                      color: mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location: ${widget.model.type == '0' ? widget.model.errorLocation : widget.model.location}",
                      style: const TextStyle(
                        color: mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.model.time,
                      style: const TextStyle(
                        color: mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 70,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 6)),
                    child: BlocBuilder(
                      bloc: widget.bloc,
                      builder: (context, state) {
                        if (state is FixErrrorsLoading &&
                            state.id == widget.model.errorId) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: LinearProgressIndicator(
                              color: mainColor.withOpacity(.8),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(3)),
                            ),
                          );
                        } else {
                          return const Text(
                            'fix error',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }
                      },
                    ),
                    onPressed: () {
                      widget.bloc.add(FixErrorsEvent(id: widget.model.errorId));
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
