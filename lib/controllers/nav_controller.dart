import 'package:get/get.dart';
import 'package:hng_task3_shopper/models/bottom_menue_model.dart';

class NavController extends GetxController {
  Rx<int> currentIndex = 0.obs;

  void onTappedBar(int index) {
    currentIndex.value = index;
  }
}

List<BottomMenuModel> bottomMenuList = [
  BottomMenuModel(
    icon: 'assets/homeIcon.svg',
    title: "Home",
  ),
  BottomMenuModel(
    icon: 'assets/shoppingIcon.svg',
    title: "Chat",
  ),
  BottomMenuModel(
    icon: 'assets/checkoutIcon.svg',
    title: "Profile",
  )
];
