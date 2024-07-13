import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng_task3_shopper/models/bottom_menue_model.dart';
import 'package:hng_task3_shopper/utils/colors.dart';
import 'package:hng_task3_shopper/views/cart_page/cart_page.dart';
import 'package:hng_task3_shopper/views/product_page/product_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  BottomNavScreenState createState() => BottomNavScreenState();
}

class BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const ProductPage(),
    Container(),
    const CartPage(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: 'assets/homeIcon.svg',
      title: "Home",
    ),
    BottomMenuModel(
      icon: 'assets/shoppingIcon.svg',
      title: "Chat",
    ),
    BottomMenuModel(
      icon: 'assets/checkoutIcon.svg',
      title: "Profile",
    )
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Card(
            color: colorsClass.darkColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: BottomNavigationBar(
                backgroundColor: colorsClass.darkColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedFontSize: 0,
                elevation: 0,
                currentIndex: _currentIndex,
                type: BottomNavigationBarType.fixed,
                items: List.generate(bottomMenuList.length, (index) {
                  return BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      bottomMenuList[index].icon,
                      fit: BoxFit.cover,
                      color: Colors.white.withOpacity(1),
                    ),
                    activeIcon: Container(
                      decoration: BoxDecoration(
                        color: colorsClass.reddishColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SvgPicture.asset(
                          bottomMenuList[index].icon,
                          color: Colors.black.withOpacity(1),
                        ),
                      ),
                    ),
                    label: '',
                  );
                }),
                onTap: (index) {
                  onTappedBar(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
