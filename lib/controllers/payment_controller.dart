import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hng_task3_shopper/utils/toast.dart';
import 'package:hng_task3_shopper/views/payment_page/payment_success_page.dart';

class PaymentController extends GetxController {
  Rx<int> selectedOption = 1.obs;
  Rx<TextEditingController> cardController = Rx(TextEditingController());
  Rx<TextEditingController> dateController = Rx(TextEditingController());
  Rx<TextEditingController> cvvController = Rx(TextEditingController());

  onCheckout() {
    if (cardController.value.text.isNotEmpty &&
        cvvController.value.text.isNotEmpty &&
        cardController.value.text.length == 16 &&
        cvvController.value.text.length == 3) {
      Get.to(() => const PaymentSuccessPage());
    } else {
      toast('Please fill all field correctly and try again');
    }
  }
}
