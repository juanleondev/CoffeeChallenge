import 'package:get/get.dart';

import 'package:coffee_challenge/app/modules/coffee_information/bindings/coffee_information_binding.dart';
import 'package:coffee_challenge/app/modules/coffee_information/views/coffee_information_view.dart';
import 'package:coffee_challenge/app/modules/home/bindings/home_binding.dart';
import 'package:coffee_challenge/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COFFEE_INFORMATION,
      page: () => CoffeeInformationView(),
      binding: CoffeeInformationBinding(),
    ),
  ];
}
