import 'package:firebase_project/repository/authentication/authentication_repository.dart';
import 'package:firebase_project/routes/app_pages.dart';
import 'package:firebase_project/routes/app_routes.dart';
import 'package:firebase_project/store/AppStore.dart';
import 'package:firebase_project/values/styles/AppTheme.dart';
import 'package:firebase_project/values/styles/constans.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import 'modules/flash_page/flash_page.dart';
import 'modules/login_page/login_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  await Firebase.initializeApp().then((value) => Get.put(AuthenticationRepository()));
  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));
  runApp(const MyApp());
}

AppStore appStore = AppStore();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => GetMaterialApp(
              scrollBehavior: SBehavior(),
              debugShowCheckedModeBanner: false,
              title: APP_NAME,
              theme: AppThemeData.lightTheme,
              darkTheme: AppThemeData.darkTheme,
              themeMode: appStore.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
              home: const FlashScreen(),
              getPages: AppPages.pages,
             // initialRoute: Routes.initial,
          // initialBinding: ,
            ));
  }
}
