

class OrdersData {
  late final List<Orders> orders;

  OrdersData.fromJson(Map<String, dynamic> json) {
    orders = List.from(json['orders']).map((e) => Orders.fromJson(e)).toList();
  }
}

class Orders {
  late final String orderID;
  late final String productID;
  late final String cellID;
  late final String orderStatus;
  late final String robotID;
  late final String time;
  late final String userID;
  late final String type;
  late final String name;


  Orders.fromJson(Map<String, dynamic> json) {
    orderID = json['orderID'];
    productID = json['productID'];
    cellID = json['cellID'];
    orderStatus = json['OrderStatus'];
   
    robotID = json['robotID'];
    time = json['time'];
    userID = json['userID'];
    type = json['type'];
    name = json['Name'];
  }
}

// enum OrderStatusEnum {
//   processing,
//   error,
//   success,
// }
