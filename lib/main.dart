import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_family/bindings/app_bindings.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/local.dart';

import 'utils/preferences_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

Future initServices() async {
  await Get.putAsync(() => PreferencesManager().initial());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) => GetMaterialApp(
        darkTheme: ThemeData(
            primaryColor: AppHelper.getAppTheme(),
            accentColor: AppHelper.getAppTheme()),
        debugShowCheckedModeBanner: false,
        locale: AppHelper.getAppLocale(),
        translations: MyTranslations(),
        initialBinding: AppBindings(),
        initialRoute: Routes.splash,
        getPages: AppRoutes.routesPages,
      ),
    );
  }
}
