import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';
import 'account_setting_page.dart';
import 'settings_page.dart';
import 'theme/provider.dart';
import 'update_profile.dart';
//import 'profile/theme/dark_mode_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Set BindingBase.debugZoneErrorsAreFatal to true before initializing bindings
  BindingBase.debugZoneErrorsAreFatal = true;

  // Initialize Flutter bindings
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => UiProvider()..init(),
        child: Consumer<UiProvider>(
            builder: (context, UiProvider notifier, child) {
          return MaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,

            //dark custom theme applied
            darkTheme:
                notifier.isDark ? notifier.darkTheme : notifier.lightTheme,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
              useMaterial3: true,
            ),
            initialRoute: '/profile',
            routes: {
              '/profile': (context) => ProfilePage(),
              '/editprofilepage': (context) => EditProfilePage(
                    initialName: 'John Doe',
                    onUpdateName: (String) {},
                  ),
              '/accountsettingepage': (context) => AccountSettingPage(),
            },
          );
        }));
  }
}
