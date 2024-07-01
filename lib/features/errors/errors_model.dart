


import 'package:intl/intl.dart';

class ErrorsData {
  late final List<ErrorModel> errors;

  ErrorsData.fromJson(Map<String, dynamic> json) {
    errors = List.from(json['error']).map((e) => ErrorModel.fromJson(e)).toList();
  }
}

class ErrorModel {
  late final String errorId;
  late final String location;
  late final String errorLocation;
  late final String robotId;
  late final String lastStatus;
  late final String type;
  late final String timestamp;
  String time = '';

  ErrorModel.fromJson(Map<String, dynamic> json) {
    errorId = json['error_id'] ?? '';
    location = json['location'] ?? '';
    robotId = json['robot_id'] ?? '';
    errorLocation = json['error_location'] ?? '';
    lastStatus = json['last_status'] ?? '';
    type = json['type'] ?? '';
    timestamp = json['timestamp'] ?? '';
    int iii = double.parse(timestamp).round();
    var date = DateTime.fromMillisecondsSinceEpoch(iii * 1000);

    time = DateFormat.yMEd().add_jm().format(date);
  }
}
