import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/features/monitoring/bloc/monitoring_bloc.dart';

import '../../../core/widgets/custom_app_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Timer? timer;
  final bloc = KiwiContainer().resolve<MonitoringBloc>()
    ..add(GetMonitoringEvent());

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      print('Refersh');
      // bloc.add(GetMonitoringEvent());
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Monitoring',
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is GetMonitoringLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetMonitoringSuccess) {
                  // robot 1
                  int robot1X = state.model.robots[0].positionX;
                  int robot1Y = state.model.robots[0].positiony;
                  // robot 2
                  int robot2X = state.model.robots[1].positionX;
                  int robot2Y = state.model.robots[1].positiony;
                  List<List<int>> list = state.model.map;
                  int sizex = state.model.map.length;
                  int sizey = state.model.map[0].length;
                  return SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        for (int i = 0; i < sizex; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SizedBox(
                              height: 32,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int j = 0; j < sizey; j++)
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(.2),
                                              child: Container(
                                                width: 30,
                                                color: list[i][j] == 0
                                                    ? Colors.grey[100]
                                                    : list[i][j] == 1
                                                        ? Colors.black
                                                        : list[i][j] == 2
                                                            ? Colors.green
                                                            : Colors.red,
                                                child: (robot1X == j &&
                                                            robot1Y == i) ||
                                                        (robot2X == i &&
                                                            robot2Y == j)
                                                    ? const Center(
                                                        child: Icon(
                                                          Icons.car_rental,
                                                          size: 22,
                                                          color: Colors.black,
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: SizedBox(),
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
