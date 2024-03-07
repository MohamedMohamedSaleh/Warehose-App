class ProductData {
  late final String id;
  late final String name;
  late final String category;
  late final String dimensions;
  late final String weight;
  late final String description;

  ProductData.fromJson(Map<String, dynamic> map) {
    id = map['ProductID'];
    name = map['Name'];
    category = map['Category'];
    dimensions = map['Dimensions'];
    weight = map['Weight'];
    description = map['Description'];
  }
}

Map<String, dynamic> productData = {
  "ProductID": "12345",
  "Name": "test scan Product",
  "Description": "Product Descriptionn",
  "Category": "Electronics",
  "Weight": "2.5",
  "Dimensions": "[10,5,5]"
};


