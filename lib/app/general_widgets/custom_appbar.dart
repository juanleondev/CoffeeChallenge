import 'package:coffee_challenge/app/modules/home/components/shopping_button.dart';
import 'package:coffee_challenge/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GetBuilder<HomeController>(
        builder: (_) => IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: _.isWhiteBackground ? Colors.brown[900] : Colors.white,
            ),
            onPressed: () {}),
      ),
      actions: [ShoppingButton()],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
