class ProductData {
  late  String id;
  late  String name;
  late  String category;
  late  String dimensions;
  late  String weight;
  late  String description;

  ProductData.fromJson(Map<String, dynamic> map) {
    id = map['ProductID'];
    name = map['Name'];
    category = map['Category'];
    dimensions = map['Dimensions'];
    weight = map['Weight'];
    description = map['Description'];
  }
}

// Map<String, dynamic> productData = {
//   "ProductID": "1233",
//   "Name": "test scan Product",
//   "Description": "Product Descriptionn",
//   "Category": "Electronics",
//   "Weight": "2.5",
//   "Dimensions": "[10,5,5]"
// };
