import 'package:flutter/material.dart';
import 'package:hng_task3_shopper/utils/colors.dart';
import 'package:hng_task3_shopper/views/payment_page/payment_page.dart';

class CheckOutPage extends StatefulWidget {
  CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  int selectedOption = 1;

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
              'Checkout',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select how to receive your package(s)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              const Text(
                'Pickup',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              ListTile(
                title: const Text(
                    "Old Secretariat Complex, Area 1, Garki Abaji Abji"),
                leading: Radio<int>(
                  value: 1,
                  groupValue: selectedOption,
                  activeColor: colorsClass.reddishColor,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text("Sokoto Street, Area 1, Garki Area 1 AMAC"),
                leading: Radio<int>(
                  value: 2,
                  groupValue: selectedOption,
                  activeColor: colorsClass.reddishColor,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
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
                child: const TextField(
                  decoration: InputDecoration(border: InputBorder.none),
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
                child: const TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 248,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: const TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: SizedBox(
                  width: 306,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PaymentPage(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: colorsClass.reddishColor),
                    child: const Text(
                      'Go to Payment',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
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
