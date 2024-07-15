import 'package:get/get.dart';
import 'package:hng_task3_shopper/models/product_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

RxList<ProductItemModel> cartItems = RxList<ProductItemModel>([]);

class ProductPageController extends GetxController {
  Rx<CarouselController> controller = CarouselController().obs;
  
  Rx<int> current = 0.obs;
  onPageChange(int index) {
    current.value = index;
  }

  void addToCart(ProductItemModel item) {
    if (!cartItems.any((cartItem) => cartItem.title == item.title)) {
      cartItems.add(item);
      Get.snackbar('', '${item.title} added to cart',
          duration: const Duration(seconds: 3));
    } else {
      Get.snackbar('', '${item.title} is already in the cart',
          duration: const Duration(seconds: 3));
    }
  }
}
