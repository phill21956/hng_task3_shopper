import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hng_task3_shopper/controllers/checkout_controller.dart';
import 'package:hng_task3_shopper/views/check_out_page/components/delivery_widget.dart';
import 'package:hng_task3_shopper/views/check_out_page/components/pick_up_widget.dart';
import 'package:hng_task3_shopper/widgets/custom_appbar_widget.dart';
import 'package:hng_task3_shopper/widgets/custom_button_widget.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key, required this.option});
  final int option;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckOutController());
    controller.deliveryController.value.clear();
    controller.contact1Controller.value.clear();
    controller.contact2Controller.value.clear();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomAppBarHeader(title: 'Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PickUpWidget(option: option, controller: controller),
              DeliveryWidget(option: option),
              const SizedBox(height: 40),
              CustomButtonWidget(
                  title: 'Go to Payment',
                  onPressed: () => controller.onCheckout(option))
            ],
          ),
        ),
      ),
    );
  }
}
