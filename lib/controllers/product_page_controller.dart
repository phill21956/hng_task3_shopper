import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hng_task3_shopper/models/get_products_model.dart';
import 'package:hng_task3_shopper/models/product_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../network/api_call.dart';

RxList<ProductItemModel> cartItems = RxList<ProductItemModel>([]);
RxList<Item> techItemCategory = RxList<Item>([]);
RxList<Item> menItemCategory = RxList<Item>([]);
RxList<Item> womenItemCategory = RxList<Item>([]);

class ProductPageController extends GetxController {
  Rx<CarouselController> controller = CarouselController().obs;

  Future<List<Item>> getTechProduct() async {
    final itemCat = await ApiCalls().httpGetProducts();
    techItemCategory.value = itemCat.items
        .where((element) => element.categories.elementAt(0).name == 'tech')
        .toList();
    return techItemCategory;
  }

  Future<List<Item>> getMenProduct() async {
    final itemCat = await ApiCalls().httpGetProducts();
    menItemCategory.value = itemCat.items
        .where((element) => element.categories.elementAt(0).name == 'men')
        .toList();
    return menItemCategory;
  }

  Future<List<Item>> getWomenProduct() async {
    final itemCat = await ApiCalls().httpGetProducts();
    womenItemCategory.value = itemCat.items
        .where((element) => element.categories.elementAt(0).name == 'women')
        .toList();
    return womenItemCategory;
  }

  Rx<int> current = 0.obs;
  onPageChange(int index) {
    current.value = index;
  }

  void addToCart(ProductItemModel item) {
    if (!cartItems.any((cartItem) => cartItem.title == item.title)) {
      cartItems.add(item);
      Get.snackbar('', '',
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.green,
          titleText: const Text(
            'Attention',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            '${item.title} added to cart',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('', '',
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.green,
          titleText: const Text(
            'Attention',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            '${item.title} is already in the cart',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
