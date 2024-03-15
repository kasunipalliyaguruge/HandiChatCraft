import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do/db_helper.dart';
import 'package:to_do/home_page.dart';
import 'package:to_do/theme.dart';
import 'package:to_do/theme_services.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
     theme:Themes.light,
     darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
    
      home: HomePage()
    );
  }
}
