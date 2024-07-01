import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/constants/my_colors.dart';
import 'package:warehouse/features/monitoring/bloc/monitoring_bloc.dart';
import 'package:warehouse/views/pages/widgets/shimmer_widget.dart';

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

  Color selectedColor({
    required List<dynamic> robot1Path1,
    required List<dynamic> robot1Path2,
    required List<dynamic> robot2Path1,
    required List<dynamic> robot2Path2,
    required List<List<int>> list,
    required int i,
    required int j,
  }) {
    Color? myColor = Colors.grey[100];
    if (list[i][j] == 0) {
      myColor = Colors.grey[100];
      // paths of robots
      for (int k = 0; k < robot1Path1.length; k++) {
        // print();
        if (robot1Path1[k].first == i && robot1Path1[k].last == j) {
          myColor = Colors.yellow;
        }
      }
      for (int k = 0; k < robot1Path2.length; k++) {
        // print();
        if (robot1Path2[k].first == i && robot1Path2[k].last == j) {
          myColor = Colors.yellow;
        }
      }
      for (int k = 0; k < robot2Path1.length; k++) {
        // print();
        if (robot2Path1[k].first == i && robot2Path1[k].last == j) {
          myColor = Colors.yellow;
        }
      }
      for (int k = 0; k < robot2Path2.length; k++) {
        // print();
        if (robot2Path2[k].first == i && robot2Path2[k].last == j) {
          myColor = Colors.yellow;
        }
      }

      /////////////////
    } else if (list[i][j] == 1) {
      myColor = Colors.black;
    } else if (list[i][j] == 2) {
      myColor = Colors.green;
    } else {
      myColor = Colors.red;
    }
    return myColor!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Monitoring',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is GetMonitoringLoading) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: ShimmerWidget.rectangular(height: 32 * 10),
                        ),
                        Text(
                          'Map loading...',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                  );
                } else if (state is GetMonitoringSuccess) {
                  // robot 1
                  List<dynamic> robot1Path1 =
                      state.model.robots[0].robotPath1 ?? [];
                  List<dynamic> robot1Path2 =
                      state.model.robots[0].robotPath2 ?? [];
                  int robotPosition1X = state.model.robots[0].positionX;
                  int robotPosition1Y = state.model.robots[0].positiony;
                  // robot 2
                  List<dynamic> robot2Path1 =
                      state.model.robots[1].robotPath1 ?? [];
                  List<dynamic> robot2Path2 =
                      state.model.robots[1].robotPath2 ?? [];
                  int robotPosition2X = state.model.robots[1].positionX;
                  int robotPosition2Y = state.model.robots[1].positiony;
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
                                              padding: const EdgeInsets.all(.1),
                                              child: Container(
                                                // width: 30,
                                                color: selectedColor(
                                                    robot1Path1: robot1Path1,
                                                    robot1Path2: robot1Path2,
                                                    robot2Path1: robot2Path1,
                                                    robot2Path2: robot2Path2,
                                                    i: i,
                                                    j: j,
                                                    list: list),
                                                child: (robotPosition1X == j &&
                                                            robotPosition1Y ==
                                                                i) ||
                                                        (robotPosition2X == i &&
                                                            robotPosition2Y ==
                                                                j)
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
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DetailsItem(
                              color: Colors.black,
                              text: 'Storage shelves.',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DetailsItem(
                              color: Colors.grey[200],
                              text: 'can move place.',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const DetailsItem(
                              color: Colors.green,
                              text: 'Charge and waiting place.',
                            ),
                          ],
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DetailsItem(
                              color: Colors.yellow,
                              text: 'Path of robot.',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DetailsItem(
                              color: Colors.red,
                              text: 'Errors.',
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailsItem extends StatelessWidget {
  const DetailsItem({
    super.key,
    required this.color,
    required this.text,
  });

  final Color? color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: color,
          height: 13,
          width: 13,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 11,
            color: mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
