import 'package:dartweek/application/modules/module.dart';
import 'package:dartweek/modules/home/home_bindings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: "/home",
      page: () => HomePage(),
      binding: HomeBindings(),
    )
  ];
}
