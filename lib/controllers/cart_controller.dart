import 'package:get/get.dart';
import 'package:hng_task3_shopper/controllers/product_page_controller.dart';
import 'package:hng_task3_shopper/models/history_model.dart';
import 'package:hng_task3_shopper/models/product_item_model.dart';
import 'package:hng_task3_shopper/utils/shared_pref.dart';
import 'package:hng_task3_shopper/views/check_out_page/check_out_page.dart';

class CartPageController extends GetxController {
  Rx<double> deliveryFee = 0.0.obs;
  Rx<int> selectedOption = 1.obs;
  RxList<OrderHistoryModel> historyList = RxList<OrderHistoryModel>([]);
  void removeCart(ProductItemModel item) {
    cartItems.remove(item);
  }

  void incrementQuantity(int index) {
    cartItems[index].quantity++;
    cartItems.refresh();
  }

  void decrementQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      cartItems.refresh();
    }
  }

  double getSubTotalAmount() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.totalPrice;
    }

    return total;
  }

  double getTotalAmount() {
    double total = 0.0;
    total = getSubTotalAmount() + deliveryFee.value;
    return total;
  }

  onCheckOut() async {
    historyList.value = await PrefUtils.getCartOrder('HISTORY');

    final list = OrderHistoryModel(orderItem: cartItems);
    historyList.insert(0, list);

    if (historyList.length > 10) {
      historyList.removeRange(15, historyList.length);
    }
    await PrefUtils.saveCartOrder('HISTORY', historyList);
    Get.to(() => CheckOutPage(option: selectedOption.value));
  }
}
