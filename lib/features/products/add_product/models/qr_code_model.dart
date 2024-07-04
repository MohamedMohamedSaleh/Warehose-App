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

Black & Decker AF300-B5 4L 1.2KG 220V 50Hz Performance Class International Warranty Black & Decker 4L 1500W AF300-B5 Black & Gold(kitchen)
{
  "ProductID": "51",
  "Name": "Black & Decker AF300-B5 4L 1.2KG 220V 50Hz Performance Class International Warranty Black",
  "propic": "https://m.media-amazon.com/images/I/61t1qG-nBUL._AC_SY879_.jpg",
  "Description":
      "6L Air Fryer with 1kg Performance Range, 1500W, Rapid Air Convection Heating\nSafe to use and easy to store.\nVery effective\nDurable design\nThe product is available without any accessories.",
  "Category": "Kitchen",
  "Weight": "4.0",
  "Dimensions": "[35,20,20]"
}

*/
/*

PXN Racing Wheel Compatible with PlayStation, Xbox and PC, USB, Black(Games)
{
  "ProductID": "41",
  "Name": "PXN Racing Wheel Compatible with PlayStation, Xbox and PC, USB, Black",
  "propic": "https://m.media-amazon.com/images/I/61AYujHtE3L._AC_SX522_.jpg",
  "Description":
      "Accessory Type: Steering Wheel\nBrand: PXN\nCompatible with: Multi",
  "Category": "Toys and  Games",
  "Weight": "5.0",
  "Dimensions": "[40,30,20]"
}

*/
/*

Black Football - Size 5(Sports)
{
  "ProductID": "34",
  "Name": "Black Football - Size 5",
  "propic": "https://m.media-amazon.com/images/I/71QPw+iTDaL._AC_SX679_.jpg",
  "Description":
      "Brand: Mikasa\nBall color: Black\nType: Football\nBall Size: Size 5\nDo you need batteries to operate the product or is this product battery operated: No\nIs this a hazardous product, a hazardous material or a waste that requires specific transportation, storage and/or disposal regulations? No",
  "Category": "Sports",
  "Weight": "2.0",
  "Dimensions": "[30,30,30]"
}

*/
/*

Adidas Power Unisex Backpack(Sports)
{
  "ProductID": "33",
  "Name": "Adidas Power Unisex Backpack",
  "propic": "https://m.media-amazon.com/images/I/81sbUz7ECWL._AC_SX679_.jpg",
  "Description":
      "Dimensions: 19cm x 3cm x 48cm\nLining: 1% recycled polyester plain weave\nMultiple zippered pockets\nMesh side pockets",
  "Category": "Sports",
  "Weight": "2.0",
  "Dimensions": "[48,25,5]"
}

*/
/*

Testa Toro Men's Casual Comfort High Top Walking Running Daily Life Shoes(Sports)
{
  "ProductID": "32",
  "Name": "Men's running and walking sneakers with soft and flexible sole, medical brush and comfortable design for daily life",
  "propic": "https://m.media-amazon.com/images/I/813XjPvGXnL._AC_SX625_.jpg",
  "Description":
      "The shoe features a soft and comfortable inner lining.\nSoft, lightweight running shoe that reduces muscle fatigue and stress.\nEasy-to-wear design keeps you comfortable all day long from Roomba.\nNew and comfortable design to fit everyone from Roomba",
  "Category": "Sports",
  "Weight": "2.0",
  "Dimensions": "[30,35,5]"
}

*/
/*

Testa Toro Men's Casual Comfort High Top Walking Running Daily Life Shoes(Sports)
{
  "ProductID": "31",
  "Name": "Testa Toro Men's Casual Comfort High Top Walking Running Daily Life Shoes",
  "propic": "https://m.media-amazon.com/images/I/41XyIT0oJ1L._AC_SY625_.jpg",
  "Description":
      "Brand: Testa Toro\nTarget group: Men\nFoam brush and medical sole\nWater friendly",
  "Category": "Sports",
  "Weight": "2.0",
  "Dimensions": "[30,35,5]"
}

*/

/*

Men's jersey T-shirt printed with the logo of the Al-Ahly football team for men in white and red TMB WR D(clothes)
{
  "ProductID": "23",
  "Name": "Zamalek Unisex Tempo Home Jersey 22/23 Fan Edition",
  "propic": "https://m.media-amazon.com/images/I/71UQkfGDQeL._AC_SX569_.jpg",
  "Description":
      "Antibacterial and breathable fabrics with Dry Plus technology.\nZamalek club official logo 3D.\nOriginal rubber hologram badge.\n100% polyester\ntight story",
  "Category": "Clothes",
  "Weight": "2.0",
  "Dimensions": "[30,30,5]"
}

*/
/*

Men's jersey T-shirt printed with the logo of the Al-Ahly football team for men in white and red TMB WR D(clothes)
{
  "ProductID": "22",
  "Name": "Men's jersey T-shirt printed with the logo of the Al-Ahly football team for men in white and red TMB WR D",
  "propic": "https://m.media-amazon.com/images/I/71ntGwHYyVL._AC_SX679_.jpg",
  "Description":
      "tight story\nMade in part with recycled materials.\nAeroReady moisture wicking technology\nAl Ahly Club Logo Heat Printed\nEmbroidered and decorated with 3 lines",
  "Category": "Clothes",
  "Weight": "2.0",
  "Dimensions": "[30,30,5]"
}

*/
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