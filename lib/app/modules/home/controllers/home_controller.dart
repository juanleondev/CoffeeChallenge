import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isWhiteBackground = false;
  int animationVelocity = 300;
  void changeBackground() {
    isWhiteBackground = !isWhiteBackground;
    update();
  }
}
