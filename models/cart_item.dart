class CartItemModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const QUANTITY = "quantity";
  static const COST = "cost";
  static const PRICE = "price";
  static const PRODUCT_ID = "productId";
  static const SIZE = "size";

  String? id;
  String? image;
  String? name;
  late int quantity;
  late double cost;
  String? productId;
  double? price;
  late int size;

  CartItemModel(
      {this.productId,
      this.id,
      this.image,
      this.name,
      required this.quantity,
      required this.size,
      required this.cost});

  CartItemModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    quantity = data[QUANTITY];
    cost = data[COST].toDouble();
    productId = data[PRODUCT_ID];
    price = data[PRICE].toDouble();
    size = data[SIZE];
  }

  Map toJson() => {
        ID: id,
        PRODUCT_ID: productId,
        IMAGE: image,
        NAME: name,
        QUANTITY: quantity,
        COST: price! * quantity,
        PRICE: price,
        SIZE: size,
      };
}
