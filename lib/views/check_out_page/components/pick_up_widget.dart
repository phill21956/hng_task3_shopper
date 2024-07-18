import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hng_task3_shopper/controllers/checkout_controller.dart';
import 'package:hng_task3_shopper/utils/colors.dart';

class PickUpWidget extends StatelessWidget {
  const PickUpWidget({
    super.key,
    required this.option,
    required this.controller,
  });

  final int option;
  final CheckOutController controller;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: option == 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Select the location you wish to pickup your package",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          const Text(
            'Pickup',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Obx(() => ListTile(
                title: const Text(
                    "Old Secretariat Complex, Area 1, Garki Abaji Abji"),
                leading: Radio<int>(
                  value: 1,
                  groupValue: controller.selectedOption.value,
                  activeColor: colorsClass.reddishColor,
                  onChanged: (value) {
                    controller.selectedOption.value = value!;
                  },
                ),
              )),
          Obx(() => ListTile(
                title: const Text("Sokoto Street, Area 1, Garki Area 1 AMAC"),
                leading: Radio<int>(
                  value: 2,
                  groupValue: controller.selectedOption.value,
                  activeColor: colorsClass.reddishColor,
                  onChanged: (value) {
                    controller.selectedOption.value = value!;
                  },
                ),
              )),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
