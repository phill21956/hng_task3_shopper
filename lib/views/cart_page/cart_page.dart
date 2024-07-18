import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hng_task3_shopper/views/cart_page/components/cart_list_builder.dart';
import 'package:hng_task3_shopper/views/cart_page/components/cart_summary_widget.dart';
import 'package:hng_task3_shopper/widgets/custom_appbar_widget.dart';
import '../../controllers/product_page_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const CustomAppBarHeader(title: 'My Cart'),
        ),
        body: Obx(
          () => cartItems.isEmpty
              ? const Center(
                  child: Text(
                    'No Item in Cart',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Expanded(
                          child:
                              SingleChildScrollView(child: CartListBuilder())),
                      CartSummaryWidget(),
                    ],
                  ),
                ),
        ));
  }
}
