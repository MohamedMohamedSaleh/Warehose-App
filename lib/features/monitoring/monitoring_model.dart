class MonitoringData {
  late final String mapSizeX;
  late final String mapSizeY;
  late final List<Robots> robots;
  late final List<List<int>> map;

  MonitoringData.fromJson(Map<String, dynamic> json) {
    mapSizeX = json['map_size_x'];
    mapSizeY = json['map_size_y'];
    robots = List.from(json['robots']).map((e) => Robots.fromJson(e)).toList();
    map = List.from(json['map'])
        .map((e) => (e as List).map((eInt) => (eInt as int)).toList())
        .toList();
  }
}

class Robots {
  late final String charge;
  late final String robotId;
  late final String orderId;
  late final String chargingPoint;
  late final String robotPosition;
  late final String robotStatus;
  late final int positionX;
  late final int positiony;

  Robots.fromJson(Map<String, dynamic> json) {
    charge = json['charge'];
    robotId = json['robot_id'];
    orderId = json['order_id'];
    chargingPoint = json['charging_point'];
    robotPosition = json['robot_position'];
    robotStatus = json['robot_status'];
    List<int> xy = [];

    for (int i = 0; i < robotPosition.length; i++) {
      if (['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
          .contains(robotPosition[i])) {
        xy.add(int.parse(robotPosition[i]));
      }
    }
    positionX = xy.first;
    positiony = xy.last;
  }
}
