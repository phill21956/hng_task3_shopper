import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hng_task3_shopper/utils/toast.dart';
import 'package:hng_task3_shopper/views/payment_page/payment_page.dart';

class CheckOutController extends GetxController {
  Rx<int> selectedOption = 1.obs;
  Rx<TextEditingController> deliveryController = Rx(TextEditingController());
  Rx<TextEditingController> contact1Controller = Rx(TextEditingController());
  Rx<TextEditingController> contact2Controller = Rx(TextEditingController());

  onCheckout(int option) {
    if (option == 2) {
      if (deliveryController.value.text.isNotEmpty &&
          contact1Controller.value.text.isNotEmpty &&
          contact1Controller.value.text.isPhoneNumber) {
        Get.to(() => const PaymentPage());
      } else {
        toast('Please fill all field correctly and try again');
      }
    } else {
      Get.to(() => const PaymentPage());
    }
  }
}
