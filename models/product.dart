class ProductModel {
  static const BRAND = "brand";
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";

  static const PRICE = "price";

  String? brand;
  String? id;
  String? image;
  String? name;

  double? price;

  ProductModel(
      {required this.brand,
      required this.id,
      required this.image,
      required this.name,
      required this.price});

  ProductModel.fromMap(Map<String, dynamic> data) {
    brand = data[BRAND];
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    price = num.tryParse(data[PRICE])?.toDouble();
  }
}
