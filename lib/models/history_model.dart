import 'package:hng_task3_shopper/models/product_item_model.dart';

class OrderHistoryModel {
  List<ProductItemModel> orderItem;

  OrderHistoryModel({required this.orderItem});

    double get totalOrderPrice {
    return orderItem.fold(0, (sum, item) => sum + item.totalPrice);
  }

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    var list = json['orderItem'] as List;
    List<ProductItemModel> productList =
        list.map((i) => ProductItemModel.fromJson(i)).toList();
    return OrderHistoryModel(orderItem: productList);
  }

  Map<String, dynamic> toJson() {
    return {
      'orderItem': orderItem.map((item) => item.toJson()).toList(),
    };
  }
}
