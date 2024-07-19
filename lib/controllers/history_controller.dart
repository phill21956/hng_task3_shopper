import 'package:get/get.dart';
import 'package:hng_task3_shopper/models/history_model.dart';
import 'package:hng_task3_shopper/utils/shared_pref.dart';

class HistoryPageController extends GetxController {
  RxList<OrderHistoryModel> orderHistory = RxList<OrderHistoryModel>([]);

  Future<void> loadOrderHistory() async {
    orderHistory.value = await PrefUtils.getCartOrder('HISTORY');
  }

  @override
  void onReady() {
    super.onReady();
    loadOrderHistory();
  }
}
