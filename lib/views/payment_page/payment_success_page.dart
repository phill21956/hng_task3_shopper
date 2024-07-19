import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hng_task3_shopper/utils/colors.dart';
import 'package:hng_task3_shopper/views/nav_bar.dart';

import '../../controllers/nav_controller.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavController());
    return WillPopScope(
      onWillPop: () async {
        controller.currentIndex.value = 0;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BottomNavScreen(),
        ));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/Malltiverse.png',
                width: 90,
              ),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/confetti.png'),
          )),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/confetti.png')),
              Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/confetti.png')),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Payment Successful',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                    ),
                    Column(
                      children: [
                        Image.asset('assets/success.png'),
                        const Text(
                          "Payment Successful",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                        const Text(
                          "Thanks for your purchase",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        controller.currentIndex.value = 0;
                        //PrefUtils.clearPreferencesData();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => BottomNavScreen(),
                        ));
                      },
                      child: Text(
                        'Go back to home',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: colorsClass.reddishColor),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
