class ProductsData {
  late final List<ProductModel> list;
 late final String message;

  ProductsData.fromJson(Map<String, dynamic> json) {
    
    list = List.from(json['product'] ?? [])
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}

class ProductModel {
  late final String image;
  late final String cellid;
  late final String status;
  late final String putTimestamp;
  late final String name;
  late final String weight;
  late final String getOrderID;
  late final String putOrderID;
  late final String category;
  late final String dimensions;
  late final String getTimestamp;
  late final String description;
  late final String productid;

  ProductModel.fromJson(Map<String, dynamic> json) {
    image = json['propic'];
    cellid = json['cellid'];
    status = json['status'];
    putTimestamp = json['put_timestamp'];
    name = json['name'];
    weight = json['weight'];
    getOrderID = json['get_orderID'];
    putOrderID = json['put_orderID'];
    category = json['category'];
    dimensions = json['dimensions'];
    getTimestamp = json['get_timestamp'];
    description = json['description'];
    productid = json['productid'];
  }
}
