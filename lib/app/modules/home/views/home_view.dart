import 'package:coffee_challenge/app/general_widgets/custom_appbar.dart';
import 'package:coffee_challenge/app/modules/home/components/coffee_list.dart';
import 'package:coffee_challenge/app/modules/home/components/shopping_button.dart';
import 'package:coffee_challenge/app/modules/home/components/swipe_detector.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        extendBodyBehindAppBar: true,
        body: SizedBox.expand(
          child: Stack(
            children: [
              GetBuilder<HomeController>(
                builder: (_) => Positioned.fill(
                    child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        _.isWhiteBackground ? Colors.white : Color(0xffa4876d),
                        Colors.white
                      ])),
                )),
              ),
              Positioned(
                  bottom: -(MediaQuery.of(context).size.width / 2) - 50,
                  child: PhysicalModel(
                    shadowColor: Colors.orange[900],
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    elevation: 40,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                    ),
                  )),
              Positioned.fill(
                  child: CoffeeList(
                names: [
                  'Caramelized Pecan Latte',
                  'Caramel Cold Drinkz',
                  'Capuchino',
                  'Caramel Macchiato',
                  'Caramel Cold Drink',
                  'Iced Coffe Mocha',
                  'Toffee Nut Iced Latte',
                  'Americano',
                  'Vietnamese-Style Iced Coffee',
                  'Black Tea Latte',
                  'Classic Irish Coffee',
                  'Toffee Nut Crunch Latte'
                ],
                prices: [
                  2.50,
                  3.00,
                  4.50,
                  3.00,
                  2.50,
                  4.00,
                  2.50,
                  3.00,
                  4.50,
                  3.00,
                  2.50,
                  4.00
                ],
              )),
            ],
          ),
        ));
  }
}
