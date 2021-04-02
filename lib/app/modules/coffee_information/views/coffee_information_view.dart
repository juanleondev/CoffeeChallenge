import 'package:coffee_challenge/app/general_widgets/custom_appbar.dart';
import 'package:coffee_challenge/app/modules/home/components/shopping_button.dart';
import 'package:coffee_challenge/app/modules/home/models/coffee_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/coffee_information_controller.dart';

class CoffeeInformationView extends GetView<CoffeeInformationController> {
  final CoffeeModel coffeeModel = Get.arguments;
  final TextStyle _buttonStyle = TextStyle(color: Colors.black, fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.brown[900],
            ),
            onPressed: () => Get.back()),
        actions: [ShoppingButton()],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 140,
              child: Text(
                coffeeModel.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.brown[900],
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox.expand(),
                  Hero(
                    tag: coffeeModel.path,
                    child: Image.asset(
                      coffeeModel.path,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 50,
                      child: PhysicalModel(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        elevation: 20,
                        borderRadius: BorderRadius.circular(5),
                        child: Text(
                          coffeeModel.price.round().toString() + '€',
                          style: TextStyle(
                              fontSize: 80,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(height: 100, child: Image.asset('assets/size.png')),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Hot/Warm',
                          style: _buttonStyle,
                        ))),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Cold/Ice',
                          style: _buttonStyle,
                        ))),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
