import 'package:firebase_project/initBinding.dart';
import 'package:firebase_project/routes/app_pages.dart';
import 'package:firebase_project/routes/app_routes.dart';
import 'package:firebase_project/store/AppStore.dart';
import 'package:firebase_project/values/styles/AppTheme.dart';
import 'package:firebase_project/values/styles/constans.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_utils/nb_utils.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialize();
  await Firebase.initializeApp();
  await GetStorage.init();
  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));
  runApp(const MyApp());
}

AppStore appStore = AppStore();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => GetMaterialApp(
              scrollBehavior: SBehavior(),
              debugShowCheckedModeBanner: false,
              title: APP_NAME,
              theme: AppThemeData.lightTheme,
              darkTheme: AppThemeData.darkTheme,
              themeMode: appStore.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
              initialBinding: InitBinding(),
              getPages: AppPages.pages,
              initialRoute: Routes.initPage,
            ));
  }
}
