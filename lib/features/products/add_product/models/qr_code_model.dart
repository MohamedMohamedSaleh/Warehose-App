class ProductData {
  late final String id;
  late final String name;
  late final String category;
  late final String dimensions;
  late final String weight;
  late final String description;
  late final String? image;

  ProductData.fromJson(Map<String, dynamic> map) {
    id = map['ProductID'];
    name = map['Name'];
    image = map['propic'];
    category = map['Category'];
    dimensions = map['Dimensions'];
    weight = map['Weight'];
    description = map['Description'];
  }
}

Map<String, dynamic> productData = {
  "ProductID": "2",
  "Name": "Laptop MacBook",
  "propic": "https://m.media-amazon.com/images/I/51c3p-0SHRL._AC_SX425_.jpg",
  "Description":
      "MOSISO Laptop Cover for MacBook Air 13 Inch 2022 2021 2020 2019 2018 A2337 M1 A2179 A1932 Retina Display with Touch ID Fingerprint, Hard Plastic, Clear Crystal, for Laptops",
  "Category": "Electronics",
  "Weight": "2.5",
  "Dimensions": "[35,30,5]"
};


/*
Redmi 12 mobile phone
{
  "ProductID": "12",
  "Name": "Redmi 12 mobile phone",
  "propic": "https://m.media-amazon.com/images/I/513rNt-cvGL._AC_SX425_.jpg",
  "Description":
      "Redmi 12 mobile phone with 8 GB RAM and 256 GB ROM, (6.79-inch screen) (4G network) - (Midnight Black), dual SIM",
  "Category": "Electronics",
  "Weight": "2.5",
  "Dimensions": "[35,30,5]"
}

*/



/*
Apple iPhone 13
{
  "ProductID": "13",
  "Name": "Apple iPhone 13",
  "propic": "https://m.media-amazon.com/images/I/51yG1FjZVYL._AC_SX425_.jpg",
  "Description":
      "Apple iPhone 13 128GB Green, Dual SIM\nAdvanced dual camera system with 12MP wide and ultra-wide cameras, photography modes, Smart HDR 4, Night Vision mode, and 4K Dolby Vision recording with HDR imaging.",
  "Category": "Electronics",
  "Weight": "2.5",
  "Dimensions": "[35,30,5]"
}
*/