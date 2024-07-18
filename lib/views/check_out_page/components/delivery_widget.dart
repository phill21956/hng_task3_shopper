import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hng_task3_shopper/controllers/checkout_controller.dart';

class DeliveryWidget extends StatelessWidget {
  const DeliveryWidget({
    super.key,
    required this.option,
  });

  final int option;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckOutController());
    return Visibility(
      visible: option == 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            "Fill the fields to get your package delivered to you",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          const Text(
            'Delivery',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(),
            ),
            child: TextField(
              controller: controller.deliveryController.value,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10)),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Contact',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Container(
            width: 248,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(),
            ),
            child: TextField(
              controller: controller.contact1Controller.value,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10)),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 248,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(),
            ),
            child: TextField(
              controller: controller.contact2Controller.value,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10)),
            ),
          ),
        ],
      ),
    );
  }
}
