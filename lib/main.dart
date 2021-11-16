import 'package:dartweek/application/bindings/application_bindings.dart';
import 'package:dartweek/application/ui/filmes_app_ui_config.dart';
import 'package:dartweek/modules/home/home_module.dart';
import 'package:dartweek/modules/login/login_module.dart';
import 'package:dartweek/modules/movie_detail/movie_detail_module.dart';
import 'package:dartweek/modules/splash/splash_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  RemoteConfig.instance.fetchAndActivate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ApplicationBindings(),
      title: FilmesAppUiConfig.title,
      theme: FilmesAppUiConfig.theme,
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
        ...MovieDetailModule().routers,
      ],
    );
  }
}
