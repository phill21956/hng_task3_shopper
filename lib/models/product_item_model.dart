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
}

final techGadgetList = [
  ProductItemModel(
    image: "assets/gamepad.png",
    title: "Joystick Game Controller",
    subTitle: 'Wired UCOM USB Pad....',
    price: 11250,
  ),
  ProductItemModel(
    image: "assets/phone.png",
    title: "Apple IPhone 14 Pro",
    subTitle: '6GB RAM + 128GB ROM',
    price: 1450000,
  ),
  ProductItemModel(
    image: "assets/watch.png",
    title: "Touch Screen Smart Watch",
    subTitle: 'For Andriod & IOS',
    price: 9170,
  ),
  ProductItemModel(
    image: "assets/airPods.png",
    title: "Itel Bluetooth Earphones",
    subTitle: 'BUDS ACE Wireless Earp..',
    price: 17660,
  ),
  ProductItemModel(
    image: "assets/laptop.png",
    title: "HP ENVY 15 X360",
    subTitle: 'INTEL Core i7 16GB RAM 512... ',
    price: 1300000,
  ),
  ProductItemModel(
    image: "assets/powerBank.png",
    title: "Oriamo 2000mAH PowerBank",
    subTitle: 'Wired UCOM USB Pad for PC....',
    price: 19990,
  ),
];

final menFashionList = [
  ProductItemModel(
    image: "assets/belt.png",
    title: "Men’s Belt Leather",
    subTitle: 'Buckle Brown Timeless Belt',
    price: 17500,
  ),
  ProductItemModel(
    image: "assets/cap.png",
    title: "Quality Plain Face Cap",
    subTitle: 'Plain Black Face CaP',
    price: 4000,
  ),
  ProductItemModel(
    image: "assets/shoe.png",
    title: "Itel Bluetooth Earphones",
    subTitle: "Men’s Formal Lace Up Shoes",
    price: 21000,
  ),
  ProductItemModel(
    image: "assets/shirt.png",
    title: "Men’s Short Sleeve",
    subTitle: 'Casual Shirt - Black & Brown',
    price: 25900,
  ),
  ProductItemModel(
    image: "assets/suit.png",
    title: "Men’s Three Piece Tuxedo",
    subTitle: 'Elegant Wedding Suit - Te... ',
    price: 65990,
  ),
  ProductItemModel(
    image: "assets/native.png",
    title: "DesubClassic Quality Agbada",
    subTitle: 'Black Agbada with a Black .....',
    price: 85000,
  ),
];

final womenFashionList = [
  ProductItemModel(
    image: "assets/bag.png",
    title: "Ladies Leather Chic Bag",
    subTitle: 'Office Trendy Handbag ...',
    price: 20950,
  ),
  ProductItemModel(
    image: "assets/dress.png",
    title: "Summer Tie Neck Long Dress",
    subTitle: 'Purple free Floral Dress',
    price: 10000,
  ),
  ProductItemModel(
    image: "assets/jewelry.png",
    title: "Ladies Crystal Bracelet",
    subTitle: "Silver Diamond Flower Brace....",
    price: 3234,
  ),
  ProductItemModel(
    image: "assets/gown.png",
    title: "Scarlet Darkness Dress",
    subTitle: 'Summer Square Neck Sleeve..',
    price: 10500,
  ),
  ProductItemModel(
    image: "assets/sweater.png",
    title: "Brown Crop Top Sweat Shirt",
    subTitle: 'Denami Women Diamond .....',
    price: 9500,
  ),
  ProductItemModel(
    image: "assets/heels.png",
    title: "Corporate High Heel",
    subTitle: 'Leather cover shoe - Black',
    price: 35000,
  ),
];