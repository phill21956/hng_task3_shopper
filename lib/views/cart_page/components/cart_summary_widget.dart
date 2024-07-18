import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hng_task3_shopper/controllers/cart_controller.dart';
import 'package:hng_task3_shopper/utils/colors.dart';

class CartSummaryWidget extends StatelessWidget {
  const CartSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartPageController());
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Shopping Summary',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub-Total',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: colorsClass.lightGreyColor),
                  ),
                  Obx(() => Text(
                        '₦${controller.getSubTotalAmount().formatMoney}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery Fee',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: colorsClass.lightGreyColor),
                  ),
                  Obx(() => Text(
                        '₦${controller.deliveryFee.value.formatMoney}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      )),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: Row(
                          children: [
                            Radio<int>(
                                value: 1,
                                groupValue: controller.selectedOption.value,
                                activeColor: colorsClass.reddishColor,
                                onChanged: (value) {
                                  controller.selectedOption.value = value!;
                                  controller.deliveryFee.value = 0;
                                }),
                            const Text("Pickup"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(() => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: Row(
                            children: [
                              Radio<int>(
                                  value: 2,
                                  groupValue: controller.selectedOption.value,
                                  activeColor: colorsClass.reddishColor,
                                  onChanged: (value) {
                                    controller.selectedOption.value = value!;
                                    controller.deliveryFee.value = 2000;
                                  }),
                              const Text("Delivery"),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              Divider(color: colorsClass.lightGreyColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: colorsClass.lightGreyColor),
                  ),
                  Obx(
                    () => Text('₦${controller.getTotalAmount().formatMoney}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 306,
                height: 44,
                child: ElevatedButton(
                  onPressed: () => controller.onCheckOut(),
                  style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: colorsClass.reddishColor),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
