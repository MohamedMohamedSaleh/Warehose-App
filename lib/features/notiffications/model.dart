

class NotificationData {
   final String title;
   final String body;


  NotificationData({
    required this.title,
    required this.body,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      NotificationData(
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
      };
}

