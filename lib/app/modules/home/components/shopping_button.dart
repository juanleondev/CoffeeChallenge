import 'package:coffee_challenge/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ShoppingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.shopping_bag_outlined,
          color: _.isWhiteBackground ? Colors.brown[900] : Colors.white,
        ),
      ),
    );
  }
}
