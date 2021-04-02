import 'package:get/get.dart';

import '../controllers/coffee_information_controller.dart';

class CoffeeInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoffeeInformationController>(
      () => CoffeeInformationController(),
    );
  }
}
