import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hng_task3_shopper/controllers/cart_controller.dart';
import 'package:hng_task3_shopper/controllers/product_page_controller.dart';
import 'package:hng_task3_shopper/utils/colors.dart';

class CartListBuilder extends StatelessWidget {
  const CartListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartPageController());
    return Obx(() => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final items = cartItems[index];
          return Card(
            child: SizedBox(
              height: 138,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        height: 78,
                        width: 60,
                        color: const Color(0xffededed),
                        child: items.image.isNotEmpty
                            ? Image.network(items.image)
                            : Image.asset('assets/empty.png'),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          items.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                        Text(
                          items.subTitle,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            width: 88,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () =>
                                      controller.decrementQuantity(index),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Icon(Icons.remove)),
                                ),
                                Text('${items.quantity}'),
                                InkWell(
                                  onTap: () =>
                                      controller.incrementQuantity(index),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Icon(Icons.add)),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () => controller.removeCart(items),
                            icon: const Icon(Icons.delete, color: Colors.red)),
                        Text(
                          '₦ ${items.totalPrice.formatMoney}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
