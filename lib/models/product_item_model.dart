class ProductItemModel {
  ProductItemModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    this.quantity = 1,
  });
  String image;
  String title;
  String subTitle;
  double price;
  int quantity;

  double get totalPrice => price * quantity;

  factory ProductItemModel.fromJson(Map<String, dynamic> json) {
    return ProductItemModel(
      image: json['image'],
      title: json['title'],
      subTitle: json['subTitle'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'subTitle': subTitle,
      'price': price,
      'quantity': quantity,
    };
  }
}
