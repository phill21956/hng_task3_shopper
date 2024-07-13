import 'package:flutter/material.dart';
import 'package:hng_task3_shopper/utils/colors.dart';
import 'package:hng_task3_shopper/views/product_page/components/carousel_build.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/Malltiverse.png',
              width: 90,
            ),
            const SizedBox(width: 20),
            const Text(
              'Product List',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 232,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      image: const DecorationImage(
                          image: AssetImage('assets/banner.png'),
                          fit: BoxFit.cover),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Premium Sound,\nPremium Savings',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              'Limited offer, hope on and get yours now',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Tech Gadget',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const CarouselBuilderWidget(),
              const SizedBox(height: 20),
              const Text(
                "Men’s Fashion",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const CarouselBuilderWidget(),
              const SizedBox(height: 20),
              const Text(
                "Women’s Fashion",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const CarouselBuilderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
